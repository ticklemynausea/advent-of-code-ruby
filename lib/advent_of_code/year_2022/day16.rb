class AdventOfCode::Year2022::Day16
  def problem1
    visited = {}
    states = []

    best = initial_state = { node: "AA", time: 0, opened: Set.new, score: 0 }
    states.push(initial_state)

    until states.empty?
      state = states.shift

      key = state.slice(:node, :time, :opened)
      if visited.fetch(key, -1) >= state[:score]
        next
      else
        visited[key] = state[:score]
      end

      best = state if state[:score] > best[:score]

      next if state[:time] == 30

      if rate[state[:node]] > 0 && !state[:opened].include?(state[:node])
        states.push(
          node: state[:node],
          time: state[:time] + 1,
          opened: Set.new([*state[:opened], state[:node]]),
          score: state[:score] + state[:opened].map { |o| rate[o] }.reduce(0, &:+)
        )
      end

      tunnels[state[:node]].each do |v|
        states.push(
          node: v,
          time: state[:time] + 1,
          opened: state[:opened],
          score: state[:score] + state[:opened].map { |o| rate[o] }.reduce(0, &:+)
        )
      end
    end

    best[:score]
  end

  def problem2
    visited = {}
    states = []

    best = initial_state = { node: "AA", elephant: "AA", time: 0, opened: Set.new, score: 0 }
    states.push(initial_state)

    until states.empty?
      state = states.shift

      key = state.slice(:node, :elephant, :time, :opened)
      if visited.fetch(key, -1) >= state[:score]
        next
      else
        visited[key] = state[:score]
      end

      best = state if state[:score] > best[:score]

      next if state[:time] == 26

      if (rate[state[:node]] > 0 && !state[:opened].include?(state[:node])) && (rate[state[:elephant]] > 0 && !state[:opened].include?(state[:elephant]))
        states.push(
          node: state[:node],
          elephant: state[:elephant],
          time: state[:time] + 1,
          opened: Set.new([*state[:opened], state[:node], state[:elephant]]),
          score: state[:score] + state[:opened].map { |o| rate[o] }.reduce(0, &:+)
        )
      elsif rate[state[:node]] > 0 && !state[:opened].include?(state[:node])
        states.push(
          node: state[:node],
          elephant: state[:elephant],
          time: state[:time] + 1,
          opened: Set.new([*state[:opened], state[:node]]),
          score: state[:score] + state[:opened].map { |o| rate[o] }.reduce(0, &:+)
        )
      elsif rate[state[:elephant]] > 0 && !state[:opened].include?(state[:elephant])
        states.push(
          node: state[:node],
          elephant: state[:elephant],
          time: state[:time] + 1,
          opened: Set.new([*state[:opened], state[:node]]),
          score: state[:score] + state[:opened].map { |o| rate[o] }.reduce(0, &:+)
        )
      end

      person = tunnels[state[:node]]
      elephant = tunnels[state[:elephant]]

      person.insert(elephant.length - person.length + 1, nil) if person.length < elephant.length
      elephant.insert(person.length - elephant.length + 1, nil) if elephant.length < person.length


      person.product(elephant).each do |p, e|
        states.push(
          node: p || state[:node],
          elephant: e || state[:elephant],
          time: state[:time] + 1,
          opened: state[:opened],
          score: state[:score] + state[:opened].map { |o| rate[o] }.reduce(0, &:+)
        )
      end
    end

    best[:score]
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
