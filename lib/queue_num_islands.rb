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
  queue = [] << coords
  moves = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  
  until queue.empty?
    current = queue.shift
    moves.each do |coordinates|
      calculation = [current, coordinates].transpose.map!(&:sum)
      next unless inside_grid?(grid, calculation) && grid[calculation[0]][calculation[1]] == '1'
      grid[calculation[0]][calculation[1]] = '2'
      queue.push(calculation)
    end
  end
  1
end

def inside_grid?(grid, calculation)
  y_axis = grid[0].length - 1
  x_axis = grid.length - 1

  calculation[0] >= 0 && calculation[0] <= x_axis && calculation[1] >= 0 && calculation[1] <= y_axis
end
