
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
    # TODO
  end
end

class Paper < Element
  def compare_to(other)
    # TODO
  end
end

class Scissors < Element
  def compare_to(other)
    # TODO
  end
end

class Lizard < Element
  def compare_to(other)
    # TODO
  end
end

class Spock < Element
  def compare_to(other)
    # TODO
  end
end