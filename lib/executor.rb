# frozen_string_literal: true

class Executor
  attr_reader :robot, :compass, :placed, :table

  def initialize(table = Table.new(5, 5))
    @table = table
    @placed = false
  end

  def valid_move?(x, y)
    @table.valid_move?(x, y)
  end

  def place(x, y, face)
    if valid_move?(x, y)
      @robot = Robot.new(x, y, face)
      @compass = Compass.new(face)
      @placed = true
    else
      Error.place
    end
  end

  def left
    @placed && @compass.turn_left(@robot.face) ? @robot.update_face(@compass.angle) : Error.left
  end

  def right
    @placed && @compass.turn_right(@robot.face) ? @robot.update_face(@compass.angle) : Error.right
  end

  def move
    if @placed
      steps = Mover.propose_move(@robot.x, @robot.y, @robot.face)
      @table.valid_move?(steps[0], steps[1]) ? @robot.update(steps[0], steps[1], @robot.face) : Error.move
    end
  end

  def report
    if @placed
      puts "Output: #{@robot.x},#{@robot.y},#{@robot.face}"
    else
      Error.report
    end
  end

  def invalid(command)
    puts "Oops! Either invalid direction or out of bounds: '#{command.strip}'"
    puts 'Valid x, y numbers : ( 0 to 4 )'
    puts 'Valid direction: ( NORTH, SOUTH, EAST, WEST )'
  end
end
