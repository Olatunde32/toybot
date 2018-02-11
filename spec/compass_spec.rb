require './lib/compass'

describe 'Compass' do
  describe 'attributes' do
    before(:example) do
      @compass = Compass.new("NORTH")
    end

    it 'allows to read angle' do 
      expect(@compass.angle).to eq(0)
    end
  end

  describe '.get_angle' do
    before(:example) do 
      @compass = Compass.new("NORTH")
    end
    
    it 'returns 0' do
      angle = @compass.get_angle("NORTH") 
      expect(angle).to eq(0)
    end

    it 'returns 90' do 
      angle = @compass.get_angle("EAST") 
      expect(angle).to eq(90)
    end

    it 'returns 180' do 
      angle = @compass.get_angle("SOUTH") 
      expect(angle).to eq(180)
    end

    it 'returns 270' do 
      angle = @compass.get_angle("WEST") 
      expect(angle).to eq(270)
    end
  end

end