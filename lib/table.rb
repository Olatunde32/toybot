class Table
  X_MIN = 0
  X_MAX = 4
  Y_MIN = 0
  Y_MAX = 4

  def initialize()
  end

  def valid_move?(x, y)
    x.between?(X_MIN, X_MAX) && y.between?(Y_MIN, Y_MAX)
  end
end