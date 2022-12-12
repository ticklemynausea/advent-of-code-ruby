class AdventOfCode::Year2022::Day12
  def problem1
    heightmap = input.map do |row|
      row.map { |chr| value(chr) }
    end

    distances = bfs(heightmap, start)

    distances[goal]
  end

  def problem2
    heightmap = input.map do |row|
      row.map { |chr| "z".ord - value(chr) }
    end

    distances = bfs(heightmap, goal)

    distances
      .filter { |(r, c)| heightmap[r][c] == "z".ord }
      .map(&:last)
      .min
  end

  def bfs(heightmap, start)
    distances = {}
    queue = []

    distances[start] = 0
    queue.push(start)

    until queue.empty?
      u = queue.shift

      paths(heightmap, *u).each do |v|
        next if distances.key?(v)

        distances[v] = distances[u] + 1
        queue.push(v)
      end
    end

    distances
  end

  def paths(heightmap, r, c)
    surrounding(heightmap, r, c).filter do |sr, sc|
      heightmap[r][c] + 1 >= heightmap[sr][sc]
    end
  end

  def surrounding(heightmap, r, c)
    [[0, 1], [1, 0], [-1, 0], [0, -1]]
      .map { |dr, dc| [r + dr, c + dc] }
      .filter do |nr, nc|
        nr.between?(0, heightmap.length - 1) \
          && nc.between?(0, heightmap[0].length - 1) \
          && (r != nr || c != nc)
      end
  end

  def value(char)
    case char
    when "S"
      "a"
    when "E"
      "z"
    else
      char
    end.ord - "a".ord
  end

  def input
    @input ||= $stdin.map(&:chomp).map(&:chars)
  end

  def start
    @start ||= find_char("S")
  end

  def goal
    @goal ||= find_char("E")
  end

  def find_char(char)
    pos = input.flatten.find_index { |c| c == char }

    [pos / input[0].length, pos % input[0].length]
  end
end
