# frozen_string_literal: true

require './lib/bundle'

describe 'Command' do
  describe '#match' do
    it 'match place' do
      com = Command.match('PLACE 0,0,NORTH')
      expect(com).to eq([:place, 0, 0, 'NORTH'])
    end

    it 'match move' do
      com = Command.match('MOVE')
      expect(com).to eq([:move])
    end

    it 'match left' do
      com = Command.match('LEFT')
      expect(com).to eq([:left])
    end

    it 'match right' do
      com = Command.match('RIGHT')
      expect(com).to eq([:right])
    end

    it 'match report' do
      com = Command.match('REPORT')
      expect(com).to eq([:report])
    end

    it 'match invalid' do
      com = Command.match('CALL')
      expect(com).to eq([:invalid, 'CALL'])
    end
  end
end
