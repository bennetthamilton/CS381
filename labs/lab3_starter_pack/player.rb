require_relative "element"
require_relative "history"

class Player
  attr_reader :name, :history

  def initialize(name)
    @name = name
    @history = History.new
  end

  def play
    fail "This method must be overridden in a subclass"
  end
end