class AdventOfCode::Year2022::Day20
  DECRYPTION_KEY = 811589153

  def problem1
    original_list = list.dup

    original_list.each do |element|
      position = list.index(element)
      number = element.first

      new_position = (number + position) % (list.length - 1)
      list.delete_at(position)
      list.insert(new_position, element)
    end

    zero_at = list.find_index { |element| element.first == 0 }
    [1000, 2000, 3000]
      .map { |p| list[(zero_at + p) % original_list.length] }
      .map(&:first)
      .reduce(&:+)
  end

  def problem2
    keyed_list = list.map { |element| [element.first * DECRYPTION_KEY, element.last] }
    original_list = keyed_list.dup

    10.times do
      original_list.each do |element|
        position = keyed_list.index(element)
        number = element.first

        new_position = (number + position) % (keyed_list.length - 1)
        keyed_list.delete_at(position)
        keyed_list.insert(new_position, element)
      end
    end

    zero_at = keyed_list.find_index { |element| element.first == 0 }
    [1000, 2000, 3000]
      .map { |p| keyed_list[(zero_at + p) % original_list.length] }
      .map(&:first)
      .reduce(&:+)
  end

  def list
    @list ||= $stdin.map.with_index { |s, idx| [s.to_i, idx] }
  end
end
