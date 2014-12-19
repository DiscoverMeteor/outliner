#!/usr/bin/ruby

# Cd to the DM_en repo, then run
#
#   for file in *.md.erb ;do ../outliner/outliner.rb < "$file" > "../DiscoverMeteor_outline/$file"; done
#
# (assuming things are in the right spot)

inMetadata = false
inComment = false

STDIN.each do |line|
  if line =~ /^\s*---/
    inMetadata = ! inMetadata
  elsif line =~ /^\s*~~~/
    inComment = ! inComment
  elsif not inMetadata and not inComment
    # not a tag, blank or a heading
    if line !~ /^\s*<%/ and line.strip != '' and line !~ /^#/
      if line =~ /^\s*- /
        puts '- ////'
      else
        puts '////'
      end
      next # don't print out this line
    end
  end
  
  puts line
end