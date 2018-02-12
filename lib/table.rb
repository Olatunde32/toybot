# frozen_string_literal: true

class Table
  attr_reader :x_min, :y_min
  attr_accessor :x_max, :y_max

  def initialize(x, y)
    @x_max = x - 1
    @y_max = y - 1
    @x_min = 0
    @y_min = 0
  end

  def valid_move?(x, y)
    x.between?(@x_min, @x_max) && y.between?(@y_min, @y_max)
  end
end
