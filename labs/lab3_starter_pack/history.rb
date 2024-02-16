
class History
  attr_accessor :plays, :opponent_plays, :score

  def initialize
    @plays = Array.new
    @opponent_plays = Array.new
    @score = 0
  end

  def log_play(move)
    # TODO
  end

  def log_opponent_play(move)
    # TODO
  end

  def add_score()
    @score += 1
  end
end