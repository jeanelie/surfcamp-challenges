class OrangeTree

  attr_reader :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
  end

  def one_year_passes!
    @age += 1

    if @age > 10 && @age <= 15
      @fruits = 200
    elsif @age > 5 && @age <= 10
      @fruits = 100
    else
      @fruits = 0
    end

    if @age <= 10
      @height += 1
    end
  end

  def pick_a_fruit!
    @fruits -= 1
  end

  def dead?
    if @age <= 50
      false
    else @age > 100
      true
    end
  end

end
