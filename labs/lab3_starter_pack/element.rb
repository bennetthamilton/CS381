
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
      "#{@name} equals #{@name}, Tie"
    when Paper
      "#{other.name} covers #{@name}, Lose"
    when Scissors
      "#{@name} crushes #{other.name}, Win"
    when Lizard
      "#{@name} crushes #{other.name}, Win"
    when Spock
      "#{other.name} vaporizes #{@name}, Lose"
    end
  end

end


class Paper < Element

  def compare_to(other)
    case other
    when Rock
      "#{@name} covers #{other.name}, Win"
    when Paper
      "#{@name} equals #{@name}, Tie"
    when Scissors
      "#{other.name} cuts #{@name}, Lose"
    when Lizard
      "#{other.name} eats #{@name}, Lose"
    when Spock
      "#{@name} disproves #{other.name}, Win"
    end
  end

end


class Scissors < Element

  def compare_to(other)
    case other
    when Rock
      "#{other.name} crushes #{@name}, Lose"
    when Paper
      "#{@name} cuts #{other.name}, Win"
    when Scissors
      "#{@name} equals #{@name}, Tie"
    when Lizard
      "#{@name} decapitates #{other.name}, Win"
    when Spock
      "#{other.name} smashes #{@name}, Lose"
    end
  end

end


class Lizard < Element

  def compare_to(other)
    case other
    when Rock
      "#{other.name} crushes #{@name}, Lose"
    when Paper
      "#{@name} eats #{other.name}, Win"
    when Scissors
      "#{@name} decapitates #{other.name}, Lose"
    when Lizard
      "#{@name} equals #{@name}, Tie"
    when Spock
      "#{other.name} poisons #{@name}, Win"
    end
  end

end


class Spock < Element

  def compare_to(other)
    case other
    when Rock
      "#{@name} vaporizes #{other.name}, Win"
    when Paper
      "#{other.name} disproves #{@name}, Lose"
    when Scissors
      "#{@name} smashes #{other.name}, Win"
    when Lizard
      "#{other.name} poisons #{@name}, Lose"
    when Spock
      "#{@name} equals #{@name}, Tie"
    end
  end

end


# # Tests
# rock  = Rock.new('Rock')
# paper = Paper.new('Paper')
# puts rock.compare_to(paper)
# puts paper.compare_to(rock)
# puts rock.compare_to(rock)