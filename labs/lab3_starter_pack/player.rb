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
  end
end