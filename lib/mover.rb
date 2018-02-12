# frozen_string_literal: true

module Mover
  def self.next_step(face)
    return [0, 1] if face == 'NORTH'
    return [1, 0] if face == 'EAST'
    return [0, -1] if face == 'SOUTH'
    return [-1, 0] if face == 'WEST'
  end

  def self.propose_move(x, y, face)
    steps = next_step(face)
    [steps[0] + x, steps[1] + y]
  end
end
