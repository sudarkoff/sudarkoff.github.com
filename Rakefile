require 'rubygems'
require 'rake'
require 'fileutils'

desc "Draft a new post"
task :new do
  puts "Enter the title:"
  title = STDIN.gets.chomp
  name = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  FileUtils.touch("drafts/#{name}.markdown")

  open("drafts/#{name}.markdown", 'a') do |f|
    f.puts "---"
    f.puts "layout: post"
    f.puts "title: #{title}"
    f.puts "comments: true"
    f.puts "summary: <TODO: enter summary>"
    f.puts "tags: [<TODO: specify tags>]"
    f.puts "---"
  end
end

desc "Startup Jekyll"
task :start do
  sh "jekyll serve"
end

desc "Build the pages locally like GitHub would do it (safe plugins)"
task :build do
  sh "jekyll build"
end

desc "Publish the changes to GitHub"
task :publish do
  sh "git push origin master"
end

task :default => :start

