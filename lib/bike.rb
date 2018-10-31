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
end
