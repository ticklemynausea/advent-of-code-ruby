class Advent2022::Day06
  def problem1
    unique_sequence_at(4)
  end

  def problem2
    unique_sequence_at(14)
  end

  private

  def unique_sequence_at(size)
    found_at = $stdin.readline.chars.each_cons(size).with_index do |byte, n|
      break n if byte & byte == byte
    end

    found_at + size
  end
end
