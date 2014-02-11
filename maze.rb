#Author: William Tarimo
#COSI236B - PA03
#2/3/2014

require_relative 'maze_search'

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
		for y in 0..@m*2
			for x in 0..@n*2
				@maze[y][x] = arg[i]
				i+=1
			end
		end
	end

	def getCoord(x,y)
		#Returns the value 0 or 1 at coordinates (x,y) in the maze
		return @maze[y][x]
	end

	def isWall?(coord)
		#Checks if given coordinates are a wall
		return getCoord(coord[0],coord[1])=='1'
	end

	def traverse(path)
		#Marks the path on the maze
		for y in 0..@m*2
			for x in 0..@n*2
				if path.include? [x,y]
					print '*'
				else
					if y.even?
						if @maze[y][x]=='1' and x.even?
							print '+'
						elsif @maze[y][x]=='1' and x.odd?
							print '-'
						else
							print ' '
						end
					else
						if @maze[y][x]=='1'
							print '|'
						else
							print ' '
						end
					end
				end
			end
			puts ""
		end
	end

	def display
		# prints a diagram of the maze on the console.
		for y in 0..@m*2
			for x in 0..@n*2
				if y.even?
					if @maze[y][x]=='1' and x.even?
						print '+'
					elsif @maze[y][x]=='1' and x.odd?
						print '-'
					else
						print ' '
					end
				else
					if @maze[y][x]=='1'
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
		problem = MazeSearch.new(Cell.new([bX*2+1,bY*2+1],nil),Cell.new([eX*2+1,eY*2+1],nil),self)
		return problem.DFS != nil
	end

	def trace(bX,bY,eX,eY)
		#traces the positions that the solution visits. Returns array of coordinates
		problem = MazeSearch.new(Cell.new([bX*2+1,bY*2+1],nil),Cell.new([eX*2+1,eY*2+1],nil),self)
		a = problem.DFS
		traverse(a)
		#path = a.values_at(* a.each_index.select {|i| i.even?})
		#return path.map! {|x,y| [x/2,y/2]}
		return nil
	end

	def redesign
		#reset all the cells and walls and come up with a random new maze of the same size.
		maze2 = ''
		for y in 0..@m*2
			for x in 0..@n*2
				if y==0 or y==m*2
					maze2 += '1'
				elsif x==0 or x==n*2
					maze2 += '1'
				else
					maze2 += rand(2).to_s
				end
			end
		end
		return maze2
	end

end

