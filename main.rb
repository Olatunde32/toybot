require "./lib/bundle"

cli = CLI.new
commands = cli.load_commands(ARGV[0])
cli.run(commands)