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

  until queue.empty?
    current = queue.shift
    land_water = surrounding_earth(grid, [current[0], current[1]])
    land_water.each do |l_w|
      next if grid[l_w[0]][l_w[1]] != '1'

      grid[l_w[0]][l_w[1]] = '2'
      l_w << current
      queue << l_w
    end
  end
  1
end

def surrounding_earth(grid, coords)
  earth_around = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  land_water = []
  earth_around.each do |coordinates|
    calculation = [] << coords << coordinates
    calculation = calculation.transpose.map!(&:sum)
    land_water << calculation if inside_grid?(grid, calculation)
  end
  land_water
end

def inside_grid?(grid, calculation)
  y_axis = grid[0].length - 1
  x_axis = grid.length - 1

  calculation[0] >= 0 && calculation[0] <= x_axis && calculation[1] >= 0 && calculation[1] <= y_axis
end
