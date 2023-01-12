

class Element 
	# create getter and setter functionality
	attr_accessor :name

	# constructor takes parameter name 
	def initialize(name)
		@name = name
	end
	# undefined (abstract) throws an exception
	def compare_to()
		fail 'This method should be overridden'
	end
end


class Rock < Element
=begin
Rock crushes Scissors
Rock crushes Lizard
Spock vaporizes Rock
Paper covers Rock
=end
	
	def initialize(name)
		@name = name
	end
	#override method to compare the argument against its own name
	def compare_to(element)
		if element.instance_of?(Rock)
			return 'Rock equals Rock', 'Tie'
		end
		if element.instance_of?(Scissors)
			return 'Rock crushes Scissors', 'Win'
		end
		if element.instance_of?(Lizard)
			return 'Rock crushes Lizard', 'Win'
		end
		if element.instance_of?(Spock)
			return 'Spock vaporizes Rock', 'Lose'
		end
		if element.instance_of?(Paper)
			return 'Paper covers Rock', 'Lose'
		end
	end
	
	
end

class Paper < Element
=begin
Paper covers Rock
Paper disproves Spock
Lizard eats Paper
Scissors cut Paper
=end

	
	def initialize(name)
		@name = name
	end
	#override method to compare the argument against its own name
	def compare_to(element)
		if element.name == 'Paper'
			return 'Paper equals Paper', 'Tie'
		end
		if element.name == 'Rock'
			return 'Paper covers Rock', 'Win'
		end
		if element.name == 'Spock'
			return 'Paper disproves Spock', 'Win'
		end
		if element.name == 'Lizard'
			return 'Lizard eats Paper', 'Lose'
		end
		if element.name == 'Scissors'
			return 'Scissors cut Paper', 'Lose'
		end
	end
	
	
end

class Scissors < Element
=begin
Scissors cut Paper
Scissors decapitate Lizard
Rock crushes Scissors
Spock smashes Scissors
=end
	
	def initialize(name)
		@name = name
	end
	#override method to compare the argument against its own name
	def compare_to(element)
		if element.name == 'Scissors'
			return 'Scissors equals Scissors', 'Tie'
		end
		if element.name == 'Paper'
			return 'Scissors cut Paper', 'Win'
		end
		if element.name == 'Lizard'
			return 'Scissors decapitate Lizard', 'Win'
		end
		if element.name == 'Spock'
			return 'Spock smashes Scissors', 'Lose'
		end
		if element.name == 'Rock'
			return 'Rock crushes Scissors', 'Lose'
		end
	end
	
	
end

class Lizard < Element
=begin
Lizard eats Paper
Lizard poisons Spock
Rock crushes Lizard
Scissors decapitate Lizard
=end
	
	
	def initialize(name)
		@name = name
	end
	#override method to compare the argument against its own name
	def compare_to(element)
		if element.name == 'Lizard'
			return 'Lizard equals Lizard', 'Tie'
		end
		if element.name == 'Paper'
			return 'Lizard eats Paper', 'Win'
		end
		if element.name == 'Spock'
			return 'Lizard poisons Spock', 'Win'
		end
		if element.name == 'Rock'
			return 'Rock crushes Lizard', 'Lose'
		end
		if element.name == 'Scissors'
			return 'Scissors decapitate Lizard', 'Lose'
		end
	end
	

end

class Spock < Element
=begin
Spock vaporizes Rock
Spock smashes Scissors
Lizard poisons Spock
Paper disproves Spock
=end
	attr_accessor :name
	def initialize(name)
		@name = name
	end
	#override method to compare the argument against its own name
	def compare_to(element)
		if element.name == 'Spock'
			return 'Spock equals Spock', 'Tie'
		end
		if element.name == 'Scissors'
			return 'Spock smashes Scissors', 'Win'
		end
		if element.name == 'Rock'
			return 'Spock vaporizes Rock', 'Win'
		end
		if element.name == 'Lizard'
			return 'Lizard poisons Spock', 'Lose'
		end
		if element.name == 'Paper'
			return 'Paper disproves Spock', 'Lose'
		end
	end
	
end


rock = Rock.new('Rock')
paper = Paper.new('Paper')
scissors = Scissors.new('Scissors')
lizard = Lizard.new('Lizard')
spock = Spock.new('Spock')

$moves = [rock, paper, scissors, lizard, spock]