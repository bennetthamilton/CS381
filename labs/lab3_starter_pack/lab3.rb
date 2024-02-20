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
	attr_accessor :rounds, :players, :history, :player, :player_subclasses

	# initialize game
	def initialize(rounds)
		@rounds = rounds
		@players = []
		@history = History.new
		@player = Player.new("Player")
		@player_subclasses = [StupidBot.new("StupidBot"), RandomBot.new("RandomBot"), IterativeBot.new("IterativeBot"), LastPlayBot.new("LastPlayBot"), Human.new("Human")]
	end

	# play a single round
	def play_round(current_round)
		puts "Round #{current_round}:"

		# get player moves
		move1 = @players[0].play											# get player move
		move2 = @players[1].play											# get player move
		puts "#{players[0].name} chose #{move1.name}"	# display player move
		puts "#{players[1].name} chose #{move2.name}"	# display player move
		@history.log_play(move1)											# update history
		@history.log_opponent_play(move2)							# update history

		# compare moves
		result = move1.compare_to(move2)							# compare moves
		puts result[0]																# display result

		# update scores
		if result[1].include?("Win")
			@players[0].add_score												# update player 1 score
			winner = @players[0]												# set winner to player 1
			display_winner_of(winner, "round")					# display winner of the round
		elsif result[1].include?("Lose")
			@players[1].add_score												# update player 2 score
			winner = @players[1]												# set winner to player 2
			display_winner_of(winner, "round")					# display winner of the round
		else 																					# result.include?("Tie")											
			puts "Round was a tie\n\n"
		end
		
		@rounds += 1																# update rounds
		
	end

	# main function
	def play_game
		welcome
		select_players
		(1..@rounds).each do |current_round|	# play rounds (1..@rounds
			play_round(current_round)
		end
		winner = find_winner_of_game				# find winner of the game
		display_results											# display final score results
		display_winner_of(winner, "game")		# display winner of the game
	end


	private

	# display the welcome message
	def welcome
		puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!\n\n"
	end

	# select players
	def select_players
		display_player_options
		loop do
			player1_index = get_player_index(1)	
			player2_index = get_player_index(2)
			if valid_player?(player1_index) && valid_player?(player2_index)
				@players.push(create_player(player1_index, "Player 1"))
				@players.push(create_player(player2_index, "Player 2"))
				break
			else	# display error message
				puts "Invalid choice(s) - start over\n\n"
			end
		end
		puts "#{players[0].name} vs. #{players[1].name}\n\n"
	end

	# display player options
	def display_player_options
		puts "Please choose two players: "
		@player_subclasses.each_with_index do |subclass, index| #TODO
      puts "(#{index + 1}) #{subclass.name}"
    end
	end

	# get player input
	def get_player_index(player_number)
		print "Select player #{player_number}: "
		gets.chomp.to_i
	end

	# checks if player input is valid
	def valid_player?(index)
		index.between?(1, 5)
	end

	# create a player
	def create_player(player_index, new_player_name)
		new_player = @player_subclasses.reverse[player_index - 1] #TODO
		new_player.new(new_player_name, @history)
	end

	# checks if move input is valid
	def valid_move?(index)
		index.between?(1, 5)
	end

	# find the winner of the round
	def find_winner_of_round
		if @players[0].get_score > @players[1].get_score
			winner = @players[0]
		elsif @players[0].get_score < @players[1].get_score
			winner = @players[1]
		else
			winner = nil
		end
	end

	# find the winner of the game
	def find_winner_of_game
		if @players[0].score > @players[1].score
			winner = @players[0]
		elsif @players[0].score < @players[1].score
			winner = @players[1]
		else
			winner = nil
		end
	end

	# display final score results
	def display_results
		puts "Final score is #{@players[0].score} to #{@players[1].score}"
	end

	# display the winner of the round
	def display_winner_of(winner, type)
		if winner.nil?
			puts "Game was a draw\n\n"
		else
			puts "#{winner.name} wins the #{type}!\n\n"
		end
	end

end 

# main play game call
game = Game.new(ROUNDS)
game.play_game