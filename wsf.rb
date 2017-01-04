#!/usr/bin/ruby

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
#
# The program chokes on Brainfuck code with symbols other than
# the standard .,+-[]<>

abort "Incorrect number of arguments.\nUsage: #{File.basename __FILE__} <infile>" if ARGV.size != 1
abort "The file #{ARGV[0]} does not exist." if not File.exist? ARGV[0]

require "#{File.dirname(__FILE__)}/constants"

program = File.read ARGV[0]										# read the input file

program.delete! "^ \t\n"

program.tr! WHITESPACE, TRINARY									# translate whitespace into trits

program += "2" if program.length.odd?							# pad with 2's if length is odd

prg_array = program.chars										# split into array

#STDERR.puts prg_array.join
#STDERR.puts prg_array.length

prg_tokens = prg_array.each_slice(2).to_a.map {|s| s.join}		# split into groups of 2 tokens
STDERR.puts prg_tokens.join ' '

prg_tokenized = prg_tokens.map {|i| TRI_TO_BF[i] || "G"}		# tokenize / translate into BF
STDERR.puts prg_tokenized.join '  '

prg_statements = prg_tokenized.map {|i| REPLACEMENTS[i]}

#################################################################

a = Array.new
ARRAY_SIZE.times { a << 0 }

i = 0

code = prg_statements.join ";"

STDERR.puts

eval code

STDERR.puts
