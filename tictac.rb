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
     (coord2[1] != coord3[1])
    true
  else
    false
  end
end

tictac = [['X', 'O', 'O'],['X', 'X', 'O'], ['O', 'X', 'O']]
puts "  1    2    3  "
p tictac[0]
p tictac[1]
p tictac[2]

x = 0
o = 0
tictac.each do |row|
  x += row.count('X')
  o += row.count('O')
end

puts "Xs: #{x}"
puts "Os: #{o}"

# Given the last array, write a program that will output an array
# that looks like: [[x1, y1], [x2, y2], ...] where x and y
# is the row and column of X's moves.

#

x_coords=[]
o_coords=[]
tictac.each do |row|
  (0..2).each do |tic|
    if row[tic] == 'X'
      x_coords.push( [ tictac.index(row) + 1, tic + 1 ] )
    else
      o_coords.push( [ tictac.index(row) + 1, tic + 1 ] )
    end
  end
end

p x_coords
p o_coords


x_len = x_coords.length
o_len = o_coords.length


(0...x_len).each do |outer|
  (0...x_len).each do |mid|
   (0...x_len).each do |inner|
      if across(x_coords[outer], x_coords[mid], x_coords[inner])
        puts "X won across"
        exit()
      elsif down(x_coords[outer], x_coords[mid], x_coords[inner])
        puts "X won down!"
        exit()
      elsif diagonal(x_coords[outer], x_coords[mid], x_coords[inner])
        puts "X won diagonally!"
        exit()
      end
    end
  end
end

(0...o_len).each do |outer|
  (0...o_len).each do |mid|
    (0...o_len).each do |inner|
      if across(o_coords[outer], o_coords[mid], o_coords[inner])
        puts "O won across"
        exit()
      elsif down(o_coords[outer], o_coords[mid], o_coords[inner])
        puts "O won down!"
        exit()
      elsif diagonal(o_coords[outer], o_coords[mid], o_coords[inner])
        puts "O won diagonally!"
        exit()
      end
    end
  end
end










