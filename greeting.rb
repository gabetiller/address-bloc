
greeting = ARGV[0]
names = ARGV.drop(1)
for name in names
  puts "#{greeting} #{name}"
end

greeting
