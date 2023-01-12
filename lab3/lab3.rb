require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  < Clara Watson >					 	#
#  < watsoncl@oregonstate.edu >	        #
#										#
#########################################


def game(rounds)
	# Begin with a welcome message
	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
	print "\n\n"
	# Next, have the user select Player1 and Player2 from a list
	puts "Please choose two players:"
	puts "(1) StupidBot"
	puts "(2) RandomBot"
	puts "(3) IterativeBot"
	puts "(4) LastPlayBot"
	puts "(5) Human"
	p1 = 0
	p2 = 0
	# Again ensure that the user can only make valid selections of one of your six Players
	# or start over and select Player 1 and Player 2 again
	while true 
		print "\n"
		print "Select player 1:"
		p1 = gets.to_i
		print "\n"
		print "Select player 2:"
		p2 = gets.to_i
		print "\n"
		if p1 == 1 || p1 == 2 || p1 == 3 || p1 == 4 || p1 == 5 
			if p2 == 1 || p2 == 2 || p2 == 3 || p2 == 4 || p2 == 5 
				break
			else
				print "\n"
				puts "Invalid move - try again"
			end
		else
			print "\n"
			puts "Invalid move - try again"
		end
	end
	playersString = ["StupidBot", "RandomBot", "IterativeBot", "LastPlayBot", "Human"]
	print "\n\n"
	puts "%s vs. %s" % [playersString[p1 - 1], playersString[p2 - 1]]
	print "\n"
	players1 = [
		StupidBot.new('StupidBot', History.new), 
		RandomBot.new('RandomBot', History.new), 
		IterativeBot.new('IterativeBot', History.new), 
		LastPlayBot.new('LastPlayBot',History.new), 
		Human.new('Human',History.new)
	]
	players2 = [
		StupidBot.new('StupidBot', History.new), 
		RandomBot.new('RandomBot', History.new), 
		IterativeBot.new('IterativeBot', History.new), 
		LastPlayBot.new('LastPlayBot',History.new), 
		Human.new('Human',History.new)
	]
	player1 = players1[p1 - 1]
	player2 = players2[p2 - 1]
	
	# using a loop structure, play five rounds of Rock-Paper-Scissors-Lizard-Spock
	for ii in 1..rounds
		print "\n"
		print "\n"
		puts "Round #{ii}:"

		# each player makes their move
		p1move = player1.play()
    	p2move = player2.play()
	
		# For each player, print out the move selected
		puts "Player 1 choose #{p1move}"
    	puts "Player 2 choose #{p2move}"
		print "\n"

		# compares moves to get winner
		prompt, outcome = p1move.compare_to(p2move)
		
		# print out the result description 
		puts "#{prompt}"
		print "\n"

		# determine the round winner
		if outcome == "Tie"
      		puts "Round was a tie"
			print "\n"
   	 	end
    	if outcome == "Win"
      		puts "Player 1 won the round"
			print "\n"
      		player1.history.add_score()
    	end
    	if outcome == "Lose"
      		puts "Player 2 won the round"
			print "\n"
      		player2.history.add_score()
    	end
	end
	# Print out the game-winner
	score1 = player1.history.score
	score2 = player2.history.score
	print "\n"
	puts "Final score is #{score1} to #{score2}"
	if score1 > score2
		print "\n"
		puts "Player 1 Wins!"
	elsif score1 < score2
		print "\n"
		puts "Player 2 Wins"
	else
		print "\n"
		puts "Game was a draw"
	end
end



# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)