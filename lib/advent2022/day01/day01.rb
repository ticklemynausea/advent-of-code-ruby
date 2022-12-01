# frozen_string_literal: true

class Advent2022::Day01
  def elves_total
    elves = [0]

    $stdin.each do |line|
      if line.chomp.empty?
        elves << 0
      else
        elves.push(elves.pop + line.to_i)
      end
    end

    elves
  end

  def problem1
    puts elves_total.max
  end

  def problem2
    puts elves_total.sort.last(3).inject(&:+)
  end
end
