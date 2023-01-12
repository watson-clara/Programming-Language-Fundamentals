
class History 
	# three instance variables
	attr_accessor :plays
    attr_accessor :opponent_plays
    attr_accessor :score

	# constructor -  Initialize both arrays to an empty array
	def initialize
		@score = 0
        @plays = Array.new
        @opponent_plays = Array.new
	end

	# push move to arrays 
	def log_play(move)
		@plays.push(move)
	end

	# push move to arrays 
	def log_opponent_play(move)
		@opponent_plays.push(move)
	end

	# increments @score by one each time it is called
	def add_score()
		@score += 1
	end
end
