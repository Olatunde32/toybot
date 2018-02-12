# frozen_string_literal: true

class Command
  def self.match(command)
    case command
    when /\APLACE (?<x>\d+),(?<y>\d+),(?<direction>\w+)\Z/
      [:place, $~[:x].to_i, $~[:y].to_i, $~[:direction]]
    when /\AMOVE\Z/
      [:move]
    when /\ALEFT\Z/
      [:left]
    when /\ARIGHT\Z/
      [:right]
    when /\AREPORT\Z/
      [:report]
    else
      [:invalid, command]
    end
  end
end
