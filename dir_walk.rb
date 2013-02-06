require 'rainbow'

unless ARGV.length == 1
  puts "Usage: ruby dir_walk.rb </path/to/directory>"
  exit
end

def directory_exists?(directory)
  File.directory?(directory)
end

def read_dir(dir, level)
  Dir.glob("#{dir}/*").each_with_object({}) do |f, h|
    level.times { print " "} 
    if File.file?(f)
      puts "#{File.basename(f)}".color(:magenta)
    elsif File.directory?(f)
      puts "#{File.basename(f)}/".color(:blue).italic
      read_dir(f, level+5)
    end
  end
end

dir = ARGV[0]

unless directory_exists?(dir)
  puts "Error: #{dir} not found or not a directory"
  exit
end

read_dir(dir, 0)