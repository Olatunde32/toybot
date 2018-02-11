require './lib/table'

describe 'Table' do 
  before(:example) do 
    @table = Table.new(5,5)
  end

  describe 'constants' do 
    it 'creates X_MIN' do 
      expect(@table.X_MIN).to eq(0)  
    end

    it 'creates Y_MIN' do 
      expect(@table.Y_MIN).to eq(0)  
    end
  end

  describe 'sets max dimension' do
    it 'sets x limit' do 
      expect(@table.x_max).to eq(4)
    end

    it 'sets y limit' do 
      expect(@table.y_max).to eq(4)
    end
  end

  describe '.valid_move?' do 
    describe 'valid x, y values' do 
      it 'allows 0,0' do
        status = @table.valid_move?(0,0)
        expect(status).to be(true)
      end

      it 'allows 5,5' do
        status = @table.valid_move?(4,4)
        expect(status).to be(true) 
      end
    end 

    describe 'invalid x, y values' do 
      it 'does not allow -1,0' do
        status = @table.valid_move?(-1,0)
        expect(status).to be(false) 
      end

      it 'does not allow 0,-1' do 
        status = @table.valid_move?(0,-1)
        expect(status).to be(false)
      end

      it 'does not allow 6,5' do 
        status = @table.valid_move?(6,5)
        expect(status).to be(false)
      end

      it 'does not allow 5,6' do 
        status = @table.valid_move?(5,6)
        expect(status).to be(false)
      end
    end
  end
end