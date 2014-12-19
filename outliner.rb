#!/usr/bin/ruby

inMetadata = false
inComment = false

STDIN.each do |line|
  if line =~ /^---/
    inMetadata = ! inMetadata
  elsif line =~ /^~~~/
    inComment = ! inComment
  elsif not inMetadata and not inComment
    # not a tag, blank or a heading
    if line !~ /^<%/ and line.strip != '' and line !~ /^#/
      if line =~ /^- /
        puts '- //'
      else
        puts '//'
      end
      next # don't print out this line
    end
  end
  
  puts line
end