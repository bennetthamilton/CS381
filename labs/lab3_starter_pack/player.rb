require_relative "element"
require_relative "history"

class Player
  attr_reader :name, :history, :moves

  def initialize(name, history = History.new)
    @name = name
    @history = history
    @moves = [Rock.new("Rock"), Paper.new("Paper"), Scissors.new("Scissors"), Lizard.new("Lizard"), Spock.new("Spock")]
  end

  def play
    fail "This method must be overridden in a subclass"
  end
end


# Subclasses
class StupidBot < Player
  def play
    rock = Rock.new("Rock")
    @history.log_play(rock)
    rock
  end
end

class RandomBot < Player
  def play
    # ref: https://www.geeksforgeeks.org/ruby-array-sample-function/
    random = @moves.sample          
    @history.log_play(random)
    random
  end
end

class IterativeBot < Player
  def play
    current = @history.total_plays % @moves.length
    selected = @moves[current]
    @history.log_play(selected)
    selected
  end
end

class LastPlayBot < Player
  def play
    
    if @history.total_plays == 0    # first play is always rock
      rock = Rock.new("Rock")
      @history.log_play(rock)
      return rock
    else                            # otherwise, play the last move of the opponent
      last_play = @history.opponent_plays.last
      @history.log_play(last_play)
      last_play
    end
  end
end

class Human < Player
  def play
    #TODO
  end
end
