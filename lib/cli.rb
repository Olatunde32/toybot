class CLI
  attr_reader :executor

  def initialize
    @executor = Executor.new()
  end

  def load_commands(commands_file)
    File.readlines(commands_file).map do |command|
      Command.match(command)
    end
  end

  def run(commands)
    commands.each do |command, *args|
      executor.send(command, *args)
    end
  end
end
