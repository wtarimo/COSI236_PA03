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
			successors.push(Cell.new([x,y+1],cell))
		end
		if !@maze.isWall? [x,y-1]
			successors.push(Cell.new([x,y-1],cell))
		end
		if !@maze.isWall? [x+1,y]
			successors.push(Cell.new([x+1,y],cell))
		end
		if !@maze.isWall? [x-1,y]
			successors.push(Cell.new([x-1,y],cell))
		end

		return successors
	end

	def DFS
		#Uses depthFirstSearch to retreave a possible path for the problem instance
		currentCell = @start
		frontier = Stack.new #Stack of new unvisited cells
		frontier.push currentCell
		explored = [] #All visited cells

		if isGoal? currentCell
			return [currentCell.coord]
		end
		while not frontier.isEmpty?
			currentCell = frontier.pop
			explored.push(currentCell)
			successors = getSuccessors currentCell
			successors.each {|succ|
				childCell = Cell.new(succ.coord,currentCell)
				inExplored = false
				explored.each {|cell|
					if cell.coord == childCell.coord
						inExplored = true
					end
				}
				if not inExplored  #Only push nodes not in explored
					if isGoal? childCell
						#Goal found: Now extract the path from the explored list
						path = []
						cell = childCell #path list ending from current childNode which is the goal
						while cell.coord != @start.coord
							path = [cell.coord] + path
							cell = cell.parent
						end
						return [cell.coord] + path
					end
					frontier.push(childCell)
				end
			}
		end
		return nil
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
	attr_accessor :list


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


