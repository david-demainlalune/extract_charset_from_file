#!/usr/local/bin/env ruby -KU
# encoding: UTF-8

require 'set'

chars_set = Set.new

lowers = []
uppers = []
digits = []
the_rest = []

def is_digit?(c)
	!!(/\d/ =~ c)
end

def is_whitespace?(c)
	!!(/[[:space:]]/ =~ c)
end

def is_lower_case?(c)
	!!(/[[:lower:]]/ =~ c)
end

def is_upper_case?(c)
	!!(/[[:upper:]]/ =~ c)
end


# main
puts "warning this script has not been tested with ruby version < 1.9" if RUBY_VERSION.to_f < 1.9

if ARGV.size != 2
	puts "script takes two arguments"
	puts "1: name of file to parse (expects utf-8)"
	puts "2: name of output file"
	exit 1
end

input_file = ARGV[0]
output_file = ARGV[1]

unless File.file?(input_file)
	puts "argument #{input_file} is not a file"
	exit 1
end

File.open(input_file, "r:utf-8") do |infile|
	while line = infile.gets
        line.chomp.each_char do |char|
        	chars_set.add(char) unless is_whitespace?(char)
        end
    end
end

# classify
chars_set.each do |c|
	case 
	when is_digit?(c)
		digits << c		
	when is_lower_case?(c)
		lowers << c
	when is_upper_case?(c)
		uppers << c
	else
		the_rest << c
	end
end

# write result
File.open(output_file, 'w') do |file| 
	lowers.sort.each { |c| file.write(c) }
	file.write("\n")

	uppers.sort.each { |c| file.write(c) }
	file.write("\n")

	digits.sort.each { |c| file.write(c) }
	file.write("\n")

	the_rest.sort.each { |c| file.write(c) }
	file.write("\n")
	file.write("glyph count: #{lowers.count + uppers.count + digits.count + the_rest.count}")
end

