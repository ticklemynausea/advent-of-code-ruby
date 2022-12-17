require "matrix"

class AdventOfCode::Year2022::Day16b
  def problem1
    load_input
  end

  def problem2
  end

  def load_input
    input = $stdin.map do |line|
      name, rate, tunnels = line
        .match(/Valve (\w+) has flow rate=(\d+); tunnels? leads? to valves? (.*)/)[1..3]
        .then { |name, rate, tunnels| [name, rate.to_i, tunnels.split(",").map(&:strip)] }
    end

    matrix = Matrix.rows([[0] * input.count] * input.count)

    indices = input.each_with_object({}).with_index { |((name, _, _), memo), i| memo[name] = i }

    input.each do |name, rate, tunnels|
      tunnels.each do |tunnel|
        matrix[indices[name], indices[tunnel]] = 1 if rate > 0
      end
    end

    puts matrix.to_a.map(&:inspect)
  end
end
