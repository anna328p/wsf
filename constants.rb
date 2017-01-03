#!/usr/bin/ruby

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
	"."		=> "STDOUT.putc a[i].chr",							# http://codegolf.stackexchange.com
	","		=> "a[i] = STDIN.getc.ord",							# licensed under CC-BY-SA 3.0
	"["		=> "while a[i] > 0 do",								# http://dk0.us/g
	"]"		=> "end",											# Fragments of code by user sepp2k
	"<"		=> "i -= 1",										# http://codegolf.stackexchange.com/users/30/sepp2k
	">"		=> "i += 1",
	"+"		=> "a[i] += 1 || 1",
	"-"		=> "a[i] -= 1 || -1"
}

WHITESPACE 	= " \t\n"											# substitution input
TRINARY		= "012"												# substitution output
