class AdventOfCode::Year2022::Day03
  def problem1
    priorities = $stdin.map(&:chomp).map do |line|
      first = line[..line.length / 2 - 1]
      second = line[line.length / 2..]
      common = first.chars.intersection(second.chars).first
      priority(common)
    end

    priorities.inject(&:+)
  end

  def problem2
    priorities = $stdin.map(&:chomp).each_slice(3).map do |a, b, c|
      badge = a.chars.intersection(b.chars).intersection(c.chars).first
      priority(badge)
    end

    priorities.inject(&:+)
  end

  private

  def priority(item)
    return item.ord - 96 if ("a".."z") === item

    item.ord - 38 if ("A".."Z") === item
  end
end
