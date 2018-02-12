# frozen_string_literal: true

class Compass
  attr_reader :angle

  def initialize(face)
    @angle = get_angle(face)
  end

  def get_angle(face)
    return 0 if face == 'NORTH'
    return 90 if face == 'EAST'
    return 180 if face == 'SOUTH'
    return 270 if face == 'WEST'
    raise ArgumentError, "Invalid direction: #{face.inspect}"
  end

  def turn_right(current_face)
    @angle = (get_angle(current_face) == 270 ? 0 : get_angle(current_face) + 90)
  end

  def turn_left(current_face)
    @angle = (get_angle(current_face).zero? ? 270 : get_angle(current_face) - 90)
  end
end
