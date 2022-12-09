class AdventOfCode::Year2021::Day02
  def problem1
    $stdin.reduce([0, 0]) do |(position, depth), line|
      command, units = line.split.then do |command, units|
        [command, units.to_i]
      end

      case command
      when "forward"
        next [position + units, depth]
      when "down"
        next [position, depth + units]
      when "up"
        next [position, depth - units]
      end
    end.reduce(:*)
  end

  def problem2
    $stdin.reduce([0, 0, 0]) do |(aim, position, depth), line|
      command, units = line.split.then do |command, units|
        [command, units.to_i]
      end

      case command
      when "forward"
        next [aim, position + units, depth + (aim * units)]
      when "down"
        next [aim + units, position, depth]
      when "up"
        next [aim - units, position, depth]
      end
    end.then { |_aim, position, depth| position * depth }
  end
end
