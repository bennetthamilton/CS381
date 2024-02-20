
class History
  attr_accessor :plays, :opponent_plays

  def initialize
    @plays = Array.new
    @opponent_plays = Array.new
  end

  def log_play(move)
    @plays.push(move)
  end

  def log_opponent_play(move)
    @opponent_plays.push(move)
  end

  def total_plays
    @plays.length
  end
end