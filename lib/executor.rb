class Executor
  attr_reader :robot, :compass

  def initialize()
    @table = Table.new()
    @placed = false
  end
  
  def place(x, y, face)
    if @table.valid_move?(x, y)
      @robot = Robot.new(x, y, face)
      @compass = Compass.new(face)  
      @placed = true 
    else
      p "Place error..."
    end
  end

  def left
    if @placed
      @compass.turn_left(@robot.face)
      @robot.update_face(@compass.angle)
    else
      p "Turn left error..."
    end
  end

  def right
    if @placed
      @compass.turn_right(@robot.face)
      @robot.update_face(@compass.angle)
    else
      p "Turn right error..."
    end
  end

  def move
    unless !@placed
      steps = Mover.propose_move(@robot.x,@robot.y,@robot.face)
      @table.valid_move?(steps[0], steps[1]) ? @robot.update(steps[0],steps[1], @robot.face) : (puts "Move error...")
    end
  end

  def report
    if @placed
      p "Output: #{@robot.x},#{@robot.y},#{@robot.face}"
    else
      p "Report error..."
    end
  end

  def invalid(command)
    puts "Oops! Either invalid direction or out of bounds: '#{command.strip}'"
    puts "Valid x, y numbers : ( 0 to 4 )"
    puts "Valid direction: ( NORTH, SOUTH, EAST, WEST )"
  end
end