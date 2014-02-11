#Author: William Tarimo
#COSI236B - PA03
#2/3/2014

require_relative 'maze'

maze = Maze.new(4,5)
maze.load("111111111100010001111010101100010101101110101100000101111011101100000101111111111111111111111111111")

maze.display
puts "\n"

puts "Possible to walk from (0,2) to (2,3): #{maze.solve(0,2,2,3)}"
puts "Possible to walk from (0,2) to (2,4): #{maze.solve(0,2,2,4)}"

puts "Path from (0,0) to (2,3): "
print maze.trace(0,0,2,3)
puts "\n\n"

grid = maze.redesign

maze2 = Maze.new(4,5)
maze2.load(grid)
maze2.display

puts "\n\n"
maze.display