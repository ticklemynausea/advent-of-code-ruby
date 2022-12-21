class AdventOfCode::Year2022::Day20
  DECRYPTION_KEY = 811589153

  def problem1
    mix(list)

    [1000, 2000, 3000]
      .map { |n| after_zero(list, n) }
      .map(&:first)
      .reduce(&:+)
  end

  def problem2
    keyed_list = list.map do |element|
      [element.first * DECRYPTION_KEY, element.last]
    end

    mix(keyed_list, 10)

    [1000, 2000, 3000]
      .map { |n| after_zero(keyed_list, n) }
      .map(&:first)
      .reduce(&:+)
  end

  def mix(list, times = 1)
    original_list = list.dup

    times.times do
      original_list.each do |element|
        position = list.index(element)
        number = element.first

        new_position = (number + position) % (list.length - 1)
        list.delete_at(position)
        list.insert(new_position, element)
      end
    end
  end

  def after_zero(list, n)
    zero_at = list.find_index { |element| element.first == 0 }
    list[(zero_at + n) % list.length]
  end

  def list
    @list ||= $stdin.map.with_index { |s, idx| [s.to_i, idx] }
  end
end
