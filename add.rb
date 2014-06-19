first = ARGV[0].to_i
sum = 0
(1..first).each do |num|
  sum = sum + num
end

puts sum