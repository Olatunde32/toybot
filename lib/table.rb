class Table
  
  attr_reader :X_MIN, :Y_MIN
  attr_accessor :x_max, :y_max
  
  def initialize(x, y)
    @x_max = x - 1
    @y_max = y - 1
    @X_MIN = 0
    @Y_MIN = 0
  end

  def valid_move?(x, y)
    x.between?(@X_MIN, @x_max) && y.between?(@Y_MIN, @y_max)
  end
end