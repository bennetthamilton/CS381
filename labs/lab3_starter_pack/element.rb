
class Element
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def compare_to(other)
    fail "This method must be overridden in a subclass"
  end
end


# Subclasses

class Rock < Element

  def compare_to(other)
    case other
    when Rock
      ['Rock equals Rock', 'Tie']
    when Paper
      ['Paper covers Rock', 'Lose']
    when Scissors
      ['Rock crushes Scissors', 'Win']
    when Lizard
      ['Rock crushes Lizard', 'Win']
    when Spock
      ['Spock vaporizes Rock', 'Lose']
    end
  end

end


class Paper < Element

  def compare_to(other)
    case other
    when Rock
      ['Paper covers Rock', 'Win']
    when Paper
      ['Paper equals Paper', 'Tie']
    when Scissors
      ['Scissors cuts Paper', 'Lose']
    when Lizard
      ['Lizard eats Paper', 'Lose']
    when Spock
      ['Paper disproves Spock', 'Win']
    end
  end

end


class Scissors < Element

  def compare_to(other)
    case other
    when Rock
      ['Rock crushes Scissors', 'Lose']
    when Paper
      ['Scissors cuts Paper', 'Win']
    when Scissors
      ['Scissors equals Scissors', 'Tie']
    when Lizard
      ['Scissors decapitates Lizard', 'Win']
    when Spock
      ['Spock smashes Scissors', 'Lose']
    end
  end

end


class Lizard < Element

  def compare_to(other)
    case other
    when Rock
      ['Rock crushes Lizard', 'Lose']
    when Paper
      ['Lizard eats Paper', 'Win']
    when Scissors
      ['Scissors decapitates Lizard', 'Lose']
    when Lizard
      ['Lizard equals Lizard', 'Tie']
    when Spock
      ['Lizard poisons Spock', 'Win']
    end
  end

end


class Spock < Element

  def compare_to(other)
    case other
    when Rock
      ['Spock vaporizes Rock', 'Win']
    when Paper
      ['Paper disproves Spock', 'Lose']
    when Scissors
      ['Spock crushes Scissors', 'Win']
    when Lizard
      ['Lizard poisons Spock', 'Lose']
    when Spock
      ['Spock equals Spock', 'Tie']
    end
  end

end


# Tests
rock  = Rock.new('Rock')
paper = Paper.new('Paper')
puts rock.compare_to(paper)
puts paper.compare_to(rock)
puts rock.compare_to(rock)