
ar1 = (1..10).to_a
ar2 = [1,3,5]

if (ar1-ar2).empty?
  puts "Array 1 is a subset of Array 2"
elsif (ar2-ar1).empty?
  puts "Array 2 is a subset of Array 1"
else
  puts "Neither array is a subset of the other"
end
