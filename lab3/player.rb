
# abstract superclass
class Player 
	# classes
	require_relative "element"
	require_relative "history"

	# two instance varibles
	attr_reader :name 
	attr_reader :history

	# constructor sets the instance variables
	def initialize(name, history)
		@name = name
		@history = history
		@counter = 0
	end

	# undefined (abstract) throws an exception
	def play()
		fail 'This method should be overridden'
	end
end

 
class StupidBot < Player
	
	#returns rock everytime
	def play()
		@history.log_play("Rock")
		return Rock.new("Rock")
	end
end

class RandomBot < Player
	
	def play()
		ranNum = rand(5)
		array = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]
		element = array[ranNum]
		if element == "Rock"
			@history.log_play("Rock")
			return Rock.new("Rock")
		end
		if element == "Paper"
			@history.log_play("Paper")
			return Paper.new("Paper")
		end
		if element == "Scissors"
			@history.log_play("Scissors")
			return Scissors.new("Scissors")
		end
		if element == "Lizard"
			@history.log_play("Lizard")
			return Lizard.new("Lizard")
		end
		if element == "Spock"
			@history.log_play("Spock")
			return Spock.new("Spock")
		end
	end
end

class IterativeBot < Player
	

	def play()
		array = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]
		element = array[@counter]
		if @counter > 4
			@counter = 0
		else
			@counter += 1
		end
		if element == "Rock"
			@history.log_play("Rock")
			return Rock.new("Rock")
		end
		if element == "Paper"
			@history.log_play("Paper")
			return Paper.new("Paper")
		end
		if element == "Scissors"
			@history.log_play("Scissors")
			return Scissors.new("Scissors")
		end
		if element == "Lizard"
			@history.log_play("Lizard")
			return Lizard.new("Lizard")
		end
		if element == "Spock"
			@history.log_play("Spock")
			return Spock.new("Spock")
		end
		
	end
end

class LastPlayBot < Player
	
	def play()
		# array for plays 
		oppPlays = @history.opponent_plays
		
		# first move will play rock 
		if oppPlays.size == 0 
			@history.log_play("Rock")
			return Rock.new("Rock")
		end

		#get previous play 
		element = oppPlays[-1]
		if element == "Rock"
			@history.log_play("Rock")
			return Rock.new("Rock")
		end
		if element == "Paper"
			@history.log_play("Paper")
			return Paper.new("Paper")
		end
		if element == "Scissors"
			@history.log_play("Scissors")
			return Scissors.new("Scissors")
		end
		if element == "Lizard"
			@history.log_play("Lizard")
			return Lizard.new("Lizard")
		end
		if element == "Spock"
			@history.log_play("Spock")
			return Spock.new("Spock")
		end
	end
end

class Human < Player
	
	def play()
		while true
			puts "(1) Rock "
			puts "(2) Paper "
			puts "(3) Scissors "
			puts "(4) Lizard "
			puts "(5) Spock "
			print "Enter your move: "
			move = gets.to_i
			if move == 1 || move == 2 ||move == 3 || move == 4 ||move == 5 
				break
			else
				puts "Invalid move - try again"
			end
		end
		array = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]
		element = array[move]
		if element == "Rock"
			@history.log_play("Rock")
			return Rock.new("Rock")
		end
		if element == "Paper"
			@history.log_play("Paper")
			return Paper.new("Paper")
		end
		if element == "Scissors"
			@history.log_play("Scissors")
			return Scissors.new("Scissors")
		end
		if element == "Lizard"
			@history.log_play("Lizard")
			return Lizard.new("Lizard")
		end
		if element == "Spock"
			@history.log_play("Spock")
			return Spock.new("Spock")
		end
	end
end
