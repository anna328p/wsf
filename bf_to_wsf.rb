#!/usr/bin/ruby

require "#{File.dirname(__FILE__)}/constants.rb"

input = ARGF.read

STDERR.puts "Converting..."

input.tr '^\.\,\<\>\[\]\+\-', ''

code = input.chars.map{|i|TRI_TO_BF.key i}.join

code.tr! TRINARY, WHITESPACE

puts code

STDERR.puts "Converted."
