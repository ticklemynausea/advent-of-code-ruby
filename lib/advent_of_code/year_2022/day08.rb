class AdventOfCode::Year2022::Day08
  def problem1
    visible_from_outside.count
  end

  def problem2
    visible_from_outside.map { |i,j| scenic_score(i, j) }.max
  end

  def grid
    @grid ||= $stdin.map(&:chomp).map { |line| line.split('').map(&:to_i) }
  end

  def side
    grid.length - 1
  end

  def visible_from_outside
    (visible_from_left(grid) + \
      visible_from_left(grid.map(&:reverse)).map { |i,j| [i, side - j] } + \
      visible_from_left(grid.transpose).map { |i,j| [j, i] } + \
      visible_from_left(grid.transpose.map(&:reverse)).map { |i,j| [side - j, i] }).uniq
  end

  def visible_from_left(transformed_grid)
    transformed_grid.flat_map.with_index { |e, n| visible_indexes(e).map { |v| [n, v] } }
  end

  def visible_indexes(sequence)
    sequence
      .map
      .with_index { |_e, n| [n, sequence[..n]] }
      .filter { |n, subseq| subseq[..-2].all? { |e| subseq.last > e  } }
      .map(&:first)
  end

  def scenic_score(i, j)
    distance_to_left(grid[i], j) * \
      distance_to_left(grid[i].reverse, side - j) * \
      distance_to_left(grid.transpose[j], i) * \
      distance_to_left(grid.transpose[j].reverse, side - i)
  end

  def distance_to_left(sequence, place)
    count_until_larger_than_first(sequence[..place].reverse)
  end

  def count_until_larger_than_first(sequence)
    sequence[1..].reduce(0) do |acc, n|
      if n < sequence.first
        next acc + 1
      else
        break acc + 1
      end
    end
  end
end
