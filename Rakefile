require 'rubygems'
require 'rake'
require 'fileutils'

desc "Draft a new post"
task :new do
  puts "What should we call this post for now?"
  name = STDIN.gets.chomp
  FileUtils.touch("drafts/#{name}.markdown")

  open("drafts/#{name}.markdown", 'a') do |f|
    f.puts "---"
    f.puts "layout: post"
    f.puts "title: \"DRAFT: #{name}\""
    f.puts "comments: true"
    f.puts "summary: "
    f.puts "tags: []"
    f.puts "---"
  end
end


desc "Startup Jekyll"
task :start do
  sh "jekyll serve"
end

task :default => :start

