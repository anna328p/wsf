#!/usr/bin/zsh

#################################################################
#		  WhiteSpaceF**k v0.0.1 by Dmitry Kudriavtsev			#
#################################################################

# Known issues:
#
# An array is preallocated for the BF code's memory. This means
# that some code may not run unless this constant is increased:
ARRAY_SIZE = 1048576
# Be aware that increasing this constant will use more memory.
#
# This program currently slurps files. Please be aware that
# large files will use more memory.
#
# This program may overflow or crash with a Ruby error if the BF
# code is not properly structured. This is an inherent property
# of the way the interpreter works. It is not a bug in my code.


abort "Incorrect number of arguments.\nUsage: #{File.basename __FILE__} <infile>" if ARGV.size != 1
abort "The file #{ARGV[0]} does not exist." if not File.exist? ARGV[0]

TRI_TO_BF = {													# Trit to BF translation table.
	"00" 	=> "+",
	"01" 	=> "-",
	"02" 	=> ">",
	"10" 	=> "<",
	"11" 	=> ".",
	"12" 	=> ",",
	"20" 	=> "[",
	"21" 	=> "]",												# "G" is a no-op in BF
	"22" 	=> "G"												# Tribute to @DestructibleWatermelon
}

REPLACEMENTS = {												# code from Code Golf Stack Exchange
	"."		=> "putc a[i]",										# http://codegolf.stackexchange.com
	","		=> "a[i] = getc",									# licensed under CC-BY-SA 3.0
	"["		=> "while a[i] > 0 do",								# http://dk0.us/g
	"]"		=> "end",											# Fragments of code by user sepp2k
	"<"		=> "i -= 1",										# http://codegolf.stackexchange.com/users/30/sepp2k
	">"		=> "i += 1",
	"+"		=> "a[i]+=1",
	"-"		=> "a[i]-=1"
}

WHITESPACE 	= " \t\n"											# substitution input
TRINARY		= "012"												# substitution output

program = File.read ARGV[0]										# read the input file

program.tr! WHITESPACE, TRINARY									# translate whitespace into trits

program += "2" if program.length.odd?							# pad with 2's if length is odd

prg_array = program.chars										# split into array

#STDERR.puts prg_array.join
#STDERR.puts prg_array.length

prg_tokens = prg_array.each_slice(2).to_a.map {|s| s.join}		# split into groups of 2 tokens
puts prg_tokens.join ' '

prg_tokenized = prg_tokens.map {|i| TRI_TO_BF[i]}				# tokenize / translate into BF
puts prg_tokenized.join '  '

prg_statements = prg_tokenized.map {|i| REPLACEMENTS[i]}

#################################################################

bf_memory = Array.new
ARRAY_SIZE.times { bf_memory << 0 }

code = prg_statements.join ";"

STDERR.puts

eval code

STDERR.puts
