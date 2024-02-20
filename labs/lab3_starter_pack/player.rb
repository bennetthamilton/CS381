require_relative "element"
require_relative "history"

class Player
  attr_accessor :name, :history, :moves, :score, :subclasses

  def initialize(name, history = History.new)
    @name = name
    @history = history
    @moves = [Rock.new("Rock"), Paper.new("Paper"), Scissors.new("Scissors"), Lizard.new("Lizard"), Spock.new("Spock")]
    @score = 0
  end

  def play
    fail "This method must be overridden in a subclass"
  end

  def add_score
    @score += 1
  end

  def get_move
    @history.plays.last
  end

end


# Subclasses
class StupidBot < Player
  def play
    rock = Rock.new("Rock")
    rock
  end
end

class RandomBot < Player
  def play
    # ref: https://www.geeksforgeeks.org/ruby-array-sample-function/
    random = @moves.sample      
    random
  end
end

class IterativeBot < Player
  def play
    current_index = (@history.round_number) % @moves.length
    selected = @moves[current_index]
    selected
  end
end

class LastPlayBot < Player
  def play
    if @history.total_plays == 0    # first play is always rock
      rock = Rock.new("Rock")
      return rock
    else                            # otherwise, play the last move of the opponent
      last_play = @history.opponent_plays.last
      last_play
    end
  end
end

class Human < Player
  def play
    display_moves
    loop do
      input = get_input
      
      case input
      when 1..5
        selected = get_move(input)
        return selected
      else
        puts "Invalid move - try again"
      end
    end
  end

  private

  def display_moves
    @moves.each_with_index do |move, index|
      puts "(#{index + 1}) #{move.name}"
    end
  end

  def get_input
    print "Enter your move: "
    gets.chomp.to_i
  end

  def get_move(input)
    @moves[input - 1]
  end
end


# # Test
# p1 = StupidBot.new('StupidBot', History.new)
# p2 = RandomBot.new('RandomBot', History.new)
# p1move = p1.play()
# p2move = p2.play()
# puts p1move.compare_to(p2move)