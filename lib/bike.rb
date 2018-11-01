class Bike
  attr_accessor :condition

  def initialize
    @condition = 'good'
  end

  def is_working
    if @condition == 'good'
      true
    else
      false
    end
  end

  def has_been_broken
    @condition = 'broken'
  end
end
