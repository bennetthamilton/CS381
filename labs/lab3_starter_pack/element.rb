
class Element
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  undef compare_to(other)
    fail "This method must be overridden in a subclass"
  end
end


# Subclasses

class Rock < Element

  def compare_to(other)
    case other
    when Rock
      # return ['self.name equals other.name', 'Tie']
    when Paper
      # return ['other.name covers self.name', 'Lose']
    when Scissors
      # return ['self.name crushes other.name', 'Win']
    when Lizard
      # return ['Rock crushes Lizard', 'Win']
    when Spock
      # return ['Spock vaporizes Rock', 'Lose']
    end
  end

end


class Paper < Element

  def compare_to(other)
    case other
    when Rock
      # return ['Paper covers Rock', 'Win']
    when Paper
      # return ['Paper equals Paper', 'Tie']
    when Scissors
      # return ['Scissors cuts Paper', 'Lose']
    when Lizard
      # return ['Lizard eats Paper', 'Lose']
    when Spock
      # return ['Paper disproves Spock', 'Win']
    end
  end

end


class Scissors < Element

  def compare_to(other)
    case other
    when Rock
      # return ['Rock crushes Scissors', 'Lose']
    when Paper
      # return ['Scissors cuts Paper', 'Win']
    when Scissors
      # return ['Scissors equals Scissors', 'Tie']
    when Lizard
      # return ['Scissors decapitates Lizard', 'Win']
    when Spock
      # return ['Spock smashes Scissors', 'Lose']
    end
  end

end


class Lizard < Element

  def compare_to(other)
    case other
    when Rock
      # return ['Rock crushes Lizard', 'Lose']
    when Paper
      # return ['Lizard eats Paper', 'Win']
    when Scissors
      # return ['Scissors decapitates Lizard', 'Lose']
    when Lizard
      # return ['Lizard equals Lizard', 'Tie']
    when Spock
      # return ['Lizard poisons Spock', 'Win']
    end
  end

end


class Spock < Element

  def compare_to(other)
    case other
    when Rock
      # return ['Spock vaporizes Rock', 'Win']
    when Paper
      # return ['Paper disproves Spock', 'Lose']
    when Scissors
      # return ['Spock crushes Scissors', 'Win']
    when Lizard
      # return ['Lizard poisons Spock', 'Lose']
    when Spock
      # return ['Spock equals Spock', 'Tie']
    end
  end

end