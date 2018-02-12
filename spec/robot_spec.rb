# frozen_string_literal: true

require './lib/robot'

describe 'Robot' do
  describe 'attributes' do
    before(:example) do
      @robot = Robot.new(0, 1, 'NORTH')
    end

    it 'allows read and write for x-position' do
      @robot.x = 4
      expect(@robot.x).to eq(4)
    end

    it 'allows read and write for y-position' do
      @robot.y = 4
      expect(@robot.y).to eq(4)
    end

    it 'allows read and write for direction' do
      @robot.face = 'WEST'
      expect(@robot.face).to eq('WEST')
    end
  end

  describe '.update_face' do
    it "returns 'NORTH' when angle is 0" do
      robot = Robot.new(1, 0, 'SOUTH')
      robot.update_face(0)
      expect(robot.face).to eq('NORTH')
    end

    it "returns 'SOUTH' when angle is 180 " do
      robot = Robot.new(1, 0, 'NORTH')
      robot.update_face(180)
      expect(robot.face).to eq('SOUTH')
    end

    it "returns 'EAST' when angle is 90 " do
      robot = Robot.new(1, 0, 'NORTH')
      robot.update_face(90)
      expect(robot.face).to eq('EAST')
    end

    it "returns 'WEST' when angle is 270" do
      robot = Robot.new(1, 0, 'NORTH')
      robot.update_face(270)
      expect(robot.face).to eq('WEST')
    end
  end

  describe '.update' do
    it 'updates all attributes' do
      robot = Robot.new(1, 1, 'SOUTH')
      robot.update(2, 2, 'EAST')
      status = "#{robot.x},#{robot.y},#{robot.face}"
      expect(status).to eq('2,2,EAST')
    end
  end
end
