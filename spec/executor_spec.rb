# frozen_string_literal: true

require './lib/bundle'

describe 'Executor' do
  before(:example) do
    @executor = Executor.new
  end

  describe 'attributes' do
    it 'create table x-limit' do
      expect(@executor.table.x_max).to eq(4)
    end
    it 'create table y-limit' do
      expect(@executor.table.y_max).to eq(4)
    end
    it 'has placed? variable' do
      expect(@executor.placed).to eq(false)
    end
  end

  describe '.place' do
    describe 'valid place' do
      before(:example) do
        @status = @executor.place(0, 0, 'NORTH')
      end

      it 'set place to true' do
        expect(@status).to be true
      end

      it 'creates robot' do
        face = @executor.robot.face
        expect(face).to eq('NORTH')
      end

      it 'creates compass' do
        angle = @executor.compass.angle
        expect(angle).to eq(0)
      end

      it 'update placed status' do
        expect(@executor.placed).to be true
      end
    end

    describe 'invalid place' do
      it 'shows place error' do
        expect { @executor.place(5, 5, 'NORTH') }.to output("Place error!\n").to_stdout
      end

      it 'placed remains false' do
        @executor.place(5, 5, 'NORTH')
        expect(@executor.placed).to eq(false)
      end
    end
  end

  describe '.valid_move?' do
    it 'returns true' do
      status = @executor.valid_move?(0, 0)
      expect(status).to be true
    end

    it 'returns false' do
      status = @executor.valid_move?(5, 5)
      expect(status).to be false
    end
  end

  describe '.left' do
    it 'turns left' do
      @executor.place(0, 0, 'NORTH')
      @executor.left
      face = @executor.robot.face
      expect(face).to eq('WEST')
    end
    it 'invalid' do
      @executor.place(5, 5, 'NORTH')
      expect { @executor.left }.to output("Turn left error!\n").to_stdout
    end
  end

  describe '.right' do
    it 'turns right' do
      @executor.place(0, 0, 'NORTH')
      @executor.right
      face = @executor.robot.face
      expect(face).to eq('EAST')
    end

    it 'invalid' do
      @executor.place(5, 5, 'NORTH')
      expect { @executor.right }.to output("Turn right error!\n").to_stdout
    end
  end

  describe '.move' do
    it 'allows valid move' do
      @executor.place(4, 3, 'NORTH')
      @executor.move
      status = @executor.robot.y
      expect(status).to eq(4)
    end

    it 'disallows invalid move' do
      @executor.place(4, 4, 'NORTH')
      expect { @executor.move }.to output("Move error!\n").to_stdout
    end
  end

  describe '.report' do
    it 'coordinates and direction' do
      @executor.place(0, 0, 'NORTH')
      expect { @executor.report }.to output("Output: 0,0,NORTH\n").to_stdout
    end
  end

  describe '.invalid' do
    it 'shows given invalid command' do
      expect { @executor.invalid('call') }.to output(<<-MESSAGE).to_stdout
Oops! Either invalid direction or out of bounds: 'call'
Valid x, y numbers : ( 0 to 4 )
Valid direction: ( NORTH, SOUTH, EAST, WEST )
      MESSAGE
    end
  end
end
