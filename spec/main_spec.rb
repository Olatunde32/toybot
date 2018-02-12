# frozen_string_literal: true

require './lib/bundle'

describe 'Main' do
  let(:valid_pass_file) { './spec/fixture/commands.txt' }
  let(:final_test_file) { './spec/fixture/final_test.txt' }
  let(:commands_file) { './commands.txt' }

  before(:example) do
    @cli = CLI.new
  end

  it 'receives input commands from file' do
    @commands = @cli.load_commands(valid_pass_file)
    status = @cli.run(@commands)
    expect(status).to match_array([[:place, 0, 0, 'NORTH'], [:move]])
  end

  context 'receives valid commands from file' do
    it 'produces valid output' do
      @commands = @cli.load_commands(commands_file)
      @cli.run(@commands)
      expect { @cli.executor.report }.to output("Output: 4,4,EAST\n").to_stdout
    end
  end
end
