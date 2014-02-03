#Author: William Tarimo
#COSI236B - PA03
#2/3/2014


class Maze
	attr_accessor :n, :m, :maze

	def initialize(n,m)
		@n = n
		@m = m
		@maze = Array.new(m*2+1) {Array.new(n*2+1)}
	end

	def load(arg)
		#initializes the maze using a string of ones and zeros
		i = 0
		for x in 0..@m*2
			for y in 0..@n*2
				@maze[x][y] = arg[i]
				i+=1
			end
		end
	end

	def display
		# prints a diagram of the maze on the console.
		for x in 0..@m*2
			for y in 0..@n*2
				if x.to_i.even?
					if @maze[x][y]=='1' and y.to_i.even?
						print '+'
					else
						print '-'
					end
				else
					if @maze[x][y]=='1'
						print '|'
					else
						print ' '
					end
				end
			end
			puts ""
		end
	end

	def solve(bX,bY,eX,eY)
		#determines if there’s a way to walk from a specified beginning 
		#position to a specified ending position. Returns 1 or 0

	end

	def trace(bX,bY,eX,eY)
		#traces the positions that the solution visits. Returns array of coordinates

	end

	def redesign()
		#reset all the cells and walls and come up with a random new maze of the same size.

	end



end

maze = Maze.new(4,4)
maze.load("111111111100010001111010101100010101101110101100000101111011101100000101111111111")
maze.display