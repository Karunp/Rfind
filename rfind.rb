#!/usr/bin/env ruby

#Karun Pandit
#September 22,2013
#Web Programming: Project 3

require 'find'

print "Files with names that matches <"
print ARGV[0]
puts ">"

#declare a regex object to hold case insensitive command line argument
myregex = Regexp.new(ARGV[0], "i")

#find and map all files with appropriate extensions
file_names = `find .`.split("\n").map.each {|file| file if file=~ /\.rb|\.erb|\.js|\.css|\.html|\.yml|\.txt/}.compact.each.sort


# first section
file_names.each do |output|
        puts "  " + output if output.match(myregex)
end
puts "**************************************************"

print "Files with content that matches <"
print ARGV[0]
puts ">"
########################################################

#section 2
file_names.each do |target_file|
	#search for files w/ content that match regex and print
	File.foreach(target_file) do |target_line|
	  if target_line.match(myregex)
		puts target_file
		break
	  end
        end
	#Look for lines that match and print w/ line numbers
	File.foreach(target_file).each_with_index do |line, linenum|
 		if line=~myregex   
		   puts "  " + "#{linenum+=1}:#{line}" 
		end
	end
	#fix this part before submitting 
	puts "--------------------------------------------------"
end
