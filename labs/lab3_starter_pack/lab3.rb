require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3				#
#																				#
#  < Bennett Hamilton >					 				#
#  < hamibenn@oregonstate.edu >	        #
#																				#
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
		puts "Round #{@rounds}"
		# get player moves
		@players.each do |player|
			move = player.play												# get player move
			puts "#{player.name} chose #{move.name}"	# display player move
			@history.log_play(move)										# update history
		end

		# compare moves
		result = @history.plays.last.compare_to(@history.opponent_plays.last)
		puts result																# display result
		# display winner
		if result.include?("Win")
			@history.add_score											# update history
			winner = @players.first
		end
		@rounds += 1															# update rounds
		display_winner_of(winner, "round")				# display winner of the round
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


	private

	# display the welcome message
	def welcome
		puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
	end

	# select players
	def select_players
		display_player_options
		loop do
			player1_index = get_player_index(1)	
			player2_index = get_player_index(2)
			if valid_player?(player1_index) && valid_player?(player2_index)
				@players.push(create_player(player1_index))
				@players.push(create_player(player2_index))
			else	# display error message
				puts 'Invalid choice(s) - start over'
			end
		end
	end

	# display player options
	def display_player_options
		puts "Please select two players: "
		Player.subclasses.each_with_index do |subclass, index|
      puts "(#{index + 1}) #{subclass.name}"
    end
	end

	# get player input
	def get_player_index(player_number)
		puts "Select player #{player_number}: "
		gets.chomp.to_i
	end

	# checks if player input is valid
	def valid_player?(index)
		index.between?(1, Player.subclasses.length)
	end

	# create a player
	def create_player(player_index)
		# create new player object
	end

	# checks if move input is valid
	def valid_move?(index)
		index.between?(1, Element.subclasses.length)
	end

	# display final score results
	def display_results
		print "Final score is #{@players[0].score} to #{@players[1].score}"
	end

	# display the winner of the round
	def display_winner_of(winner, type)
		puts "#{winner.name} wins the #{type}!"
	end
end 

# main play game call
game = Game.new(ROUNDS)
game.play