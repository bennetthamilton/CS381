require_relative "element"
require_relative "history"

class Player
  attr_reader :name, :history

  def initialize(name, history = History.new)
    @name = name
    @history = history
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
    element_array = [Rock.new("Rock"), Paper.new("Paper"), Scissors.new("Scissors"), Lizard.new("Lizard"), Spock.new("Spock")]
    random = element_array.sample          
    @history.log_play(random)
    random
  end
end

class IterativeBot < Player
  def play
    #TODO
  end
end

class LastPlayBot < Player
  def play
    #TODO
  end
end

class Human < Player
  def play
    #TODO
  end
end
