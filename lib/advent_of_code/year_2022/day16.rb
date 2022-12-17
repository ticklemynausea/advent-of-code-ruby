class AdventOfCode::Year2022::Day16

  Node = Class.new do
    def initialize(name)
      @name = name
      @rate = nil
      @tunnels = []
    end

    attr_accessor :name, :rate, :tunnels
  end

  def score
    graph.values.select(&:opened?).map(&:rate).reduce(0, &:+)
  end

  def opened
    graph.values.select(&:opened?).map(&:name)
  end


  State = Struct.new(:position, :time, :score, :opened, keyword_init: true)
  def problem1

    load_input

    start = "AA"

    visited = {} # TODO optimize
    states = []

    states << State.new(position: start, time: 0, score: 0, opened: [])
    best = states.first

    until states.empty?
      state = states.shift

      if visited.fetch([state.time, state.position, state.opened], -1) >= state.score
        next
      else
        visited[[state.time, state.position, state.opened]] = state.score
      end

      if state.score > best.score
        best = state
      end

      if state.score + 200 < best.score
        next
      end

      if state.time == 30
        next
      end

      valve = graph.fetch(state.position)
      if valve.rate > 0 && !state.opened.include?(valve.name)
        states.push(
          State.new(
            position: state.position,
            time: state.time + 1,
            score: state.score + state.opened.map { |opened| graph.fetch(opened) }.map(&:rate).reduce(0, &:+),
            opened: [*state.opened, state.position]
          )
        )
      end

      valve.tunnels.each do |next_valve|
        states.push(
          State.new(
            position: next_valve,
            time: state.time + 1,
            score: state.score + state.opened.map { |opened| graph.fetch(opened) }.map(&:rate).reduce(0, &:+),
            opened: state.opened
          )
        )
      end
    end

    best.score
  end

  State2 = Struct.new(:person, :elephant, :time, :score, :opened, keyword_init: true)
  def problem2

    load_input

    start = "AA"

    visited = {} # TODO optimize
    states = []

    states << State2.new(person: start, elephant: start, time: 0, score: 0, opened: [])
    best = states.first

    until states.empty?
      state = states.shift

      if visited.fetch([state.time, state.person, state.elephant, state.opened], -1) >= state.score
        next
      else
        visited[[state.time, state.person, state.elephant, state.opened]] = state.score
      end

      if state.score > best.score
        best = state
      end

      if state.time == 26
        next
      end

      valve = graph.fetch(state.person)
      if valve.rate > 0 && !state.opened.include?(valve.name)
        states.push(
          State2.new(
            person: state.person,
            elephant: state.elephant,
            time: state.time + 1,
            score: state.score + state.opened.map { |opened| graph.fetch(opened) }.map(&:rate).reduce(0, &:+),
            opened: [*state.opened, state.person]
          )
        )
      end

      valve.tunnels.each do |next_valve|
        states.push(
          State2.new(
            person: next_valve,
            elephant: state.elephant,
            time: state.time + 1,
            score: state.score + state.opened.map { |opened| graph.fetch(opened) }.map(&:rate).reduce(0, &:+),
            opened: state.opened
          )
        )
      end

      valve = graph.fetch(state.elephant)
      if valve.rate > 0 && !state.opened.include?(valve.name)
        states.push(
          State2.new(
            person: state.person,
            elephant: state.elephant,
            time: state.time + 1,
            score: state.score + state.opened.map { |opened| graph.fetch(opened) }.map(&:rate).reduce(0, &:+),
            opened: [*state.opened, state.elephant]
          )
        )
      end

      valve.tunnels.each do |next_valve|
        states.push(
          State2.new(
            person: state.person,
            elephant: next_valve,
            time: state.time + 1,
            score: state.score + state.opened.map { |opened| graph.fetch(opened) }.map(&:rate).reduce(0, &:+),
            opened: state.opened
          )
        )
      end
    end

    puts best
    best.score
  end

  def load_input
    @graph ||=  begin
      graph = {}

      $stdin.each do |line|
        name, rate, tunnels = line
          .match(/Valve (\w+) has flow rate=(\d+); tunnels? leads? to valves? (.*)/)[1..3]
          .then { |name, rate, tunnels| [name, rate.to_i, tunnels.split(",").map(&:strip)] }

        valve = graph.key?(name) ? graph[name] : graph[name] = Node.new(name)
        valve.rate = rate
        valve.tunnels = tunnels
        #.map do |name|
        #  valve = graph.key?(name) ? graph[name] : graph[name] = Node.new(name)
        #end
      end

      graph
    end
  end

  attr_reader :graph
end
