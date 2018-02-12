# frozen_string_literal: true

require './lib/mover'

describe 'Mover' do
  describe '#next_step' do
    it 'NORTH to be [0,1]' do
      steps = Mover.next_step('NORTH')
      expect(steps).to match_array([0, 1])
    end

    it 'EAST to be [1,0]' do
      steps = Mover.next_step('EAST')
      expect(steps).to match_array([1, 0])
    end

    it 'SOUTH to be [0,-1]' do
      steps = Mover.next_step('SOUTH')
      expect(steps).to match_array([0, -1])
    end

    it 'WEST to be [-1,0]' do
      steps = Mover.next_step('WEST')
      expect(steps).to match_array([-1, 0])
    end
  end

  describe '#propose_move' do
    it 'goes 1, 1, NORTH' do
      move = Mover.propose_move(1, 1, 'NORTH')
      expect(move).to match_array([1, 2])
    end

    it 'goes 1, 1, SOUTH' do
      move = Mover.propose_move(1, 1, 'SOUTH')
      expect(move).to match_array([1, 0])
    end

    it 'goes 1, 1, EAST' do
      move = Mover.propose_move(1, 1, 'EAST')
      expect(move).to match_array([2, 1])
    end

    it 'goes 1, 1, WEST' do
      move = Mover.propose_move(1, 1, 'WEST')
      expect(move).to match_array([0, 1])
    end
  end
end
