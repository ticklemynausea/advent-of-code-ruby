class AdventOfCode::Year2022::Day16


  def problem1
    visited = {}
    states = []

    best = initial_state = {node: "AA", time: 0, opened: [], score: 0}
    states.push(initial_state)

    until states.empty?
      state = states.shift

      puts state.inspect

      key = state.slice(:node, :time, :opened)
      if visited.fetch(key, -1) >= state[:score]
        next
      else
        visited[key] = state[:score]
      end

      if state[:score] > best[:score]
        best = state
      end

      if state[:time] == 30
        next
      end

      if rate[state[:node]] > 0 && !state[:opened].include?(state[:node])
        states.push(
          node: state[:node],
          time: state[:time] + 1,
          opened: [*state[:opened], state[:node]],
          score: state[:score] + state[:opened].map { |o| rate[o] }.reduce(0, &:+),
        )
      end

      tunnels[state[:node]].each do |v|
        states.push(
          node: v,
          time: state[:time] + 1,
          opened: state[:opened],
          score: state[:score] + state[:opened].map { |o| rate[o] }.reduce(0, &:+),
        )
      end
    end

    best[:score]
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
