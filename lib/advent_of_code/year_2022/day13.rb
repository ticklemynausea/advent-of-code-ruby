require "json"

class AdventOfCode::Year2022::Day13
  def problem1
    each_pair.map.with_index(1) do |(left, right), index|
      next index if compare(left, right)

      0
    end.reduce(&:+)
  end

  def problem2
  end

  def in_pairs(left, right)
    if left.length >= right.length
      left.zip(right)
    else
      right.zip(left).map(&:reverse)
    end
  end

  def compare(left, right)
    if left.is_a?(Array) && right.is_a?(Array)
      return true if left.empty? && !right.empty?
      return false if right.empty? && !left.empty?

      in_pairs(left, right).each do |subleft, subright|
        return true if subleft.nil? && !subright.nil?
        return false if subright.nil? && !subleft.nil?

        compare(subleft, subright).then do |value|
          return value if [true, false].include?(value)
        end
      end

      nil
    elsif left.is_a?(Array) && right.is_a?(Integer)
      compare(left, [right])

    elsif left.is_a?(Integer) && right.is_a?(Array)
      compare([left], right)

    elsif left.is_a?(Integer) && right.is_a?(Integer)
      return nil if left == right

      left < right
    end
  end

  def each_pair
    Enumerator.new do |enum|
      $stdin.map(&:chomp).each_slice(3) do |left, right, _blank|
        enum << [JSON.parse(left), JSON.parse(right)]
      end
    end
  end
end
