# frozen_string_literal: true

require './lib/bundle'

describe 'CLI' do
  let(:test_file) { './spec/fixture/commands.txt' }

  before(:example) do
    @cli = CLI.new
    @commands = @cli.load_commands(test_file)
  end

  describe 'attributes' do
    it 'allows read of executor' do
      expect(@cli.executor.placed).to eq(false)
    end
  end

  describe '#load_commands' do
    it 'process file input' do
      expect(@commands[0]).to match_array([:place, 0, 0, 'NORTH'])
    end
  end
  describe '#run' do
    it 'process single input' do
      status = @cli.run([:move])
      expect(status).to eq([:move])
    end

    it 'process batch input' do
      status = @cli.run(@commands)
      expect(status).to match_array([[:place, 0, 0, 'NORTH'], [:move]])
    end
  end
end
