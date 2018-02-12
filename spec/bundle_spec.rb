require './lib/bundle'

describe 'Bundle' do
  describe 'requires relative files' do
    it 'command' do 
      status = Command.match("MOVE")
      expect(status).to eq([:move])
    end

    it 'compass' do 
      compass = Compass.new("NORTH")
      expect(compass.angle).to eq(0)
    end
        
    it 'error' do 
      expect{Error.place}.to output("Place error!\n").to_stdout
    end
    
    it 'executor' do 
      executor = Executor.new
      expect(executor.placed).to eq(false)
    end

    it 'mover' do
      steps = Mover.next_step("NORTH")
      expect(steps).to match_array([0,1])
    end    

    it 'robot' do
      robot = Robot.new(0,1,"NORTH")
      expect(robot.face).to eq("NORTH")
    end

    it 'table' do
      @table = Table.new(5,5)
      status = @table.valid_move?(4,4)
      expect(status).to be(true) 
    end
  end
end