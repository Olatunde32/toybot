require './lib/robot'

describe 'Robot' do 
  describe 'attributes' do
    
    before(:example) do 
      @robot = Robot.new(0,1,"NORTH")
    end
    
    it "allows read and write for position :x" do
      @robot.x = 4
      expect(@robot.x).to eq(4)
    end

    it "allows read and write for position :y" do
      @robot.y = 4
      expect(@robot.y).to eq(4)
    end

    it "allows read and write for position :face" do
      @robot.face = "WEST"
      expect(@robot.face).to eq("WEST")
    end
  end
  
  describe "updates" do
    
    describe "update face" do
      it "allows to return 'NORTH' when angle is 0 " do
        robot = Robot.new(1,0,"SOUTH")
        robot.update_face(0)
        expect(robot.face).to eq("NORTH")
      end

      it "allows to return 'SOUTH' when angle is 180 " do
        robot = Robot.new(1,0,"NORTH")
        robot.update_face(180)
        expect(robot.face).to eq("SOUTH")
      end

      it "allows to return 'EAST' when angle is 90 " do
        robot = Robot.new(1,0,"NORTH")
        robot.update_face(90)
        expect(robot.face).to eq("EAST")
      end

      it "allows to return 'WEST' when angle is 270 " do
        robot = Robot.new(1,0,"NORTH")
        robot.update_face(270)
        expect(robot.face).to eq("WEST")
      end
    end
  end
end