class Robot
  attr_accessor :x, :y, :face

  def initialize(x, y, face)
    @x = x
    @y = y
    @face = face
  end

  def update_face(angle)
    case(angle)
    when 0 
      @face = "NORTH"
    when 90 
      @face = "EAST"
    when 180 
      @face = "SOUTH"
    when 270 
      @face = "WEST"
    else
    end
  end

  def update(new_x,new_y, new_face)
    @x = new_x 
    @y = new_y
    @face = new_face
  end
end