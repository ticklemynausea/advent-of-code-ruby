class AdventOfCode::Year2022::Day04
  def problem1
    ranges.map do |first_range, second_range|
      first_range.cover?(second_range) || second_range.cover?(first_range)
    end.count(&:itself)
  end

  def problem2
    ranges.map do |first_range, second_range|
      first_range.cover?(second_range.first) ||
        second_range.cover?(first_range.first)
    end.count(&:itself)
  end

  private

  def ranges
    $stdin.map(&:chomp).map do |line|
      first, second = line.split(",")
      first_range = Range.new(*first.split("-").map(&:to_i))
      second_range = Range.new(*second.split("-").map(&:to_i))

      [first_range, second_range]
    end
  end
end
