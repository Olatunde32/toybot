# Toy Robot Simulator

Toy robot simulation, moving around square table top ( 5 x 5 units ). Input is received through a file and output is shown to the console.

Project specifications are stated in [PROBLEM.md](PROBLEM.md). It defines the requirements, use cases, input and output format and deliverables.

## Installation

1. Install Ruby
  - See [instructions](https://www.ruby-lang.org/en/documentation/installation/) on ruby-lang.org
2. Install Bundler
  - See [instructions](http://bundler.io/) on bundler.io
  - It may be as simple as typing `gem install bundler`
3. Clone this repository on your development machine:
  
  - Type 'git clone https://github.com/eibay/toybot.git'
  - See [instructions](https://help.github.com/articles/cloning-a-repository/) on github.com for more details about cloning a repository.
4. Install required gems:
  - Cd to the toyrobot directory: `cd ~/toyrobot`
  - Type `bundle install`
  - This will download and install all the gems required for this project.


### Input

Main app reads input from a [file](commands.txt) called `commands.txt` in the main directory. A sample of the contents of this file would be:

```
PLACE 0,0,NORTH
LEFT
REPORT
```

## License
This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for your rights and limitations.

## Contributing
NOTE: by contributing changes to the code, you agree to license your contribution under the [MIT License](LICENSE.md)