require 'byebug'

def num_islands(grid)
  x_axis = grid[0].length - 1
  y_axis = grid.length - 1
  nb_isles = 0

  (0..y_axis).each do |y|
    (0..x_axis).each do |x|
      nb_isles += map_the_island(grid, [y, x]) if grid[y][x] == '1'
    end
  end
  nb_isles
end

def map_the_island(grid, coords)
  stack = [] << coords
  moves = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  
  until stack.empty?
    current = stack.first
    moves.each do |m|
      calc = [current, m].transpose.map!(&:sum)
      next unless square_available?(grid, calc)
      grid[calc[0]][calc[1]] = '2'
      stack.unshift(calc)
      break
    end
    stack.shift if stack.first == current
  end
  1
end

def square_available?(grid, coords)
  y_axis = grid[0].length - 1
  x_axis = grid.length - 1

  coords[0] >= 0 && coords[0] <= x_axis && coords[1] >= 0 && coords[1] <= y_axis && grid[coords[0]][coords[1]] == '1'
end

puts num_islands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
