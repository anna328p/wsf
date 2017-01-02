#!/usr/bin/ruby

require "./constants.rb"

input = ARGF.read

STDERR.puts "Converting..."

code = input.chars.map{|i|TRI_TO_BF.key i}.join

code.tr! TRINARY, WHITESPACE

puts code

STDERR.puts "Converted."
