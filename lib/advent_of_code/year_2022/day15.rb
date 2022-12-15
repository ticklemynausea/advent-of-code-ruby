class AdventOfCode::Year2022::Day15
  def problem1
    load_input

    intervals = scan_row(the_row).sort_by(&:first)

    range = aggregate(intervals)
      .reduce(0) { |memo, (x, y)| memo + (y - x + 1).abs }

    range - beacons_row(the_row, intervals).count
  end

  def problem2
    load_input

    (0..boundary).each do |row|
      intervals = scan_row(row)
        .map { |p1, p2| [[0, p1].max, [boundary, p2].min] }
        .sort_by(&:first)

      aggregated = aggregate(intervals)

      next if aggregated.count == 1

      return row + (4_000_000 * (aggregated.first.last + 1))
    end
  end

  def beacons_row(row, intervals)
    input
      .filter { |_, (_bx, by)| by == row }
      .select { |_, (bx, by)| by == row && intervals.any? { |x1, x2| bx.between?(x1, x2) } }
      .map { |_, (bx, _by)| bx }
      .uniq
  end

  def scan_row(row)
    input.map do |(sx, sy), (bx, by)|
      dx = (bx - sx).abs
      dy = (by - sy).abs
      d = dx + dy

      wy = (sy - row).abs
      wx = d - wy

      next if wx <= 0

      [sx - wx, sx + wx]
    end.compact
  end

  def aggregate(intervals)
    aggregated = []

    intervals.each do |interval|
      index = aggregated.find_index do |u|
        interval.first <= u.last + 1 && u.first <= interval.last + 1
      end

      if index
        aggregated[index] = [
          [aggregated[index].first, interval.first].min,
          [aggregated[index].last, interval.last].max
        ]
      else
        aggregated << interval
      end
    end

    aggregated
  end

  def load_input
    @the_row = $stdin.readline.to_i
    @boundary = $stdin.readline.to_i
    @input = $stdin.map do |line|
      sx, sy, bx, by = line
        .match(/Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/)[1..4]
        .map(&:to_i)

      [[sx, sy], [bx, by]]
    end
  end

  attr_reader :the_row, :boundary, :input
end
