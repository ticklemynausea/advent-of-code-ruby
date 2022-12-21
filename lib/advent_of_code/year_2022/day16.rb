class AdventOfCode::Year2022::Day16


  def problem1
    visited = {}
    states = []

    best = initial_state = ["AA", 0, [], 0]
    states.push(initial_state)

    until states.empty?
      state = states.shift

      puts state.inspect

      key = [state[0], state[1], state[2]]
      if visited.fetch(key, -1) >= state[3]
        next
      else
        visited[key] = state[3]
      end

      if state[3] > best[3]
        best = state
      end

      if state[1] == 30
        next
      end

      if rate[state[0]] > 0 && !state[2].include?(state[0])
        states.push([
          state[0],
          state[1] + 1,
          [*state[2], state[0]],
          state[3] + state[2].map { |o| rate[o] }.reduce(0, &:+),
        ])
      end

      tunnels[state[0]].each do |v|
        states.push([
          v,
          state[1] + 1,
          state[2],
          state[3] + state[2].map { |o| rate[o] }.reduce(0, &:+),
        ])
      end
    end

    best[3]
  end


  def problem2
  end

  def tunnels
    @tunnels ||= graph.transform_values { |v| v[:tunnels] }
  end

  def rate
    @rate ||= graph.transform_values { |v| v[:rate] }
  end

  def graph
    @graph ||= $stdin.map do |line|
      name, rate, tunnels = line
        .match(/Valve (\w+) has flow rate=(\d+); tunnels? leads? to valves? (.*)/)[1..3]
        .then { |name, rate, tunnels| [name, rate.to_i, tunnels.split(",").map(&:strip)] }

      { name => { rate:, tunnels: } }
    end.reduce(&:merge)
  end
end
