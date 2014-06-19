def across(coord1, coord2, coord3)
  if (coord1[0] == coord2[0]) &&
     (coord2[0] == coord3[0]) &&
     (coord1[1] != coord2[1]) &&
     (coord2[1] != coord3[1]) &&
     (coord1[1] != coord3[1])
    true
  else
    false
  end
end

def down(coord1, coord2, coord3)
  if (coord1[0] != coord2[0]) &&
     (coord2[0] != coord3[0]) &&
     (coord1[0] != coord3[0]) &&
     (coord1[1] == coord2[1]) &&
     (coord2[1] == coord3[1])
    true
  else
    false
  end
end

def diagonal(coord1, coord2, coord3)

  if (coord1[0] != coord2[0]) &&
     (coord1[0] != coord3[0]) &&
     (coord3[0] != coord2[0]) &&
     (coord1[1] != coord2[1]) &&
     (coord1[1] != coord3[1]) &&
     (coord2[1] != coord3[1]) &&
   ( ((coord1[1] < coord2[1]) &&
     (coord2[1] < coord3[1])) ||
     ((coord1[1] > coord2[1]) &&
       (coord2[1] > coord3[1])) ) &&
    ( ((coord1[0] < coord2[0]) &&
      (coord2[0] < coord3[0])) ||
      ((coord1[0] > coord2[0]) &&
        (coord2[0] > coord3[0])) )
    true
  else
    false
  end
end

tictac = [['O', 'O', 'X'],['X', 'X', 'O'], ['X', 'O', 'X']]
puts "    0    1    2  "
print "0 "
p tictac[0]
print "1 "
p tictac[1]
print "2 "
p tictac[2]

x = 0
o = 0
tictac.each do |row|
  x += row.count('X')
  o += row.count('O')
end

# puts "\nXs: #{x}"
# puts "Os: #{o}"

# Given the last array, write a program that will output an array
# that looks like: [[x1, y1], [x2, y2], ...] where x and y
# is the row and column of X's moves.

#

x_coords=[]
o_coords=[]
count = 0

tictac.each do |row|
  (0..2).each do |tic|
    if row[tic] == 'X'
      x_coords.push( [ count, tic] )
    else
      o_coords.push( [ count , tic] )
    end
  end
  count += 1
end
# puts ""
# print "X-coords: "
# p x_coords
# print "O-coords: "
# p o_coords


x_len = x_coords.length
o_len = o_coords.length


(0...x_len).each do |outer|
  (0...x_len).each do |mid|
   (0...x_len).each do |inner|
      if across(x_coords[outer], x_coords[mid], x_coords[inner])
        puts "\nX won across"
        exit()
      elsif down(x_coords[outer], x_coords[mid], x_coords[inner])
        puts "\nX won down!"
        exit()
      elsif diagonal(x_coords[outer], x_coords[mid], x_coords[inner])
        puts "\nX won diagonally!"
        # p x_coords[outer]
        # p x_coords[mid]
        # p x_coords[inner]
        exit()
      end
    end
  end
end

(0...o_len).each do |outer|
  (0...o_len).each do |mid|
    (0...o_len).each do |inner|
      if across(o_coords[outer], o_coords[mid], o_coords[inner])
        puts "\nO won across"
        exit()
      elsif down(o_coords[outer], o_coords[mid], o_coords[inner])
        puts "\nO won down!"
        exit()
      elsif diagonal(o_coords[outer], o_coords[mid], o_coords[inner])
        puts "\nO won diagonally!"
        # p o_coords[outer]
        # p o_coords[mid]
        # p o_coords[inner]
        exit()
      end
    end
  end
end










