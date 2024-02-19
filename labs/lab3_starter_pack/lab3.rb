require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  < Bennett Hamilton >					 	#
#  < hamibenn@oregonstate.edu >	                	#
#										#
#########################################

# constants
ROUNDS = 5

class Game

	def initialize(@rounds)
		@rounds = rounds
		@players = []
		@history = History.new
	end

	# play a single round
	def play_round
		# get player1 move
		# get player2 move
		# compare moves
		# display winner
		# update history
		# update rounds
		# display winner of the round
	end

	# main function
	def play_game
		welcome
		select_players
		while rounds > 0
			play_round
		end
		display_results
		display_winner_of(winner, "game")
	end

	# select players
	def select_players
		# display player options
		# selcect players loop
			# get player1 index
			# get player2 index
			# if valid players
				# create player1
				# create player2
			# else
				# display error message
		# end
	end

	private

	# display the welcome message
	def welcome
		puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
	end

	# display player options
	def display_player_options

	end

	# get player input
	def get_player_index(player_number)
		# puts Select player (player_number)
		# gets.chomp.to_i
	end

	# checks if player input is valid
	def valid_player?(player_index)
		# valid if player_index is between 1 and 5
	end

	# create a player
	def create_player(player_index)
		# create new player object
	end

	# checks if move input is valid
	def valid_move?(move_index)
		# valid if move_index is between 1 and 5
	end

	# display final score results
	def display_results
		# puts final score is blank to blank
	end

	# display the winner of the round
	def display_winner_of(winner, type)
		# puts winning player is the winner of the round/game!
	end
end 

# main play game call
game = Game.new(ROUNDS)
game.play