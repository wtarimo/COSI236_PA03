#Author: William Tarimo
#COSI236B - PA03
#2/3/2014

class MazeSearch
	#Implements a search problem in the maze
	attr_accessor :start, :goal

	def initialize(start,goal,maze)
		@start = start
		@goal = goal
		@maze = maze
	end

	def isGoal?(cell)
		#Checks if the given cell is the goal cell
		return cell.coord == @goal.coord
	end

	def getSuccessors(cell)
		#Returns an array of all cells reachable by 1-step from the current cell
		successors = []
		x,y = cell.coord
		if !@maze.isWall? [x,y+1]
			successors.push(Cell.new([x,y+1],cell.coord))
		end
		if !@maze.isWall? [x,y-1]
			successors.push(Cell.new([x,y-1],cell.coord))
		end
		if !@maze.isWall? [x+1,y]
			successors.push(Cell.new([x+1,y],cell.coord))
		end
		if !@maze.isWall? [x-1,y]
			successors.push(Cell.new([x-1,y],cell.coord))
		end

		return successors
	end

end


class Cell
	#Implements a cell in the maze, a state is the cell's coordinates
	attr_accessor :coord, :parent

	def initialize(coord,parent)
		@coord = coord
		@parent = parent
	end

end

class Stack
	#Implements a stack with the last-in-first-out (LIFO) policy

	def initialize()
		@list = []
	end

	def push(item)
		#Pushes an item onto the stack
		@list.push(item)
	end

	def pop
		#Pops and returns the most recently pushed item from the stack
		return @list.pop
	end

	def isEmpty?
		#Returns true if the stack is empty
		return @list.size==0
	end

end


