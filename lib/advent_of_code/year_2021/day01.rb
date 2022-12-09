class AdventOfCode::Year2021::Day01
  def problem1
    count_consecutive($stdin.map(&:to_i))
  end

  def problem2
    count_consecutive($stdin.map(&:to_i).each_cons(3).map { |cons| cons.reduce(&:+) })
  end

  def count_consecutive(list)
    list.each_cons(2).reduce(0) do |acum, (first, second)|
      next acum + 1 if second > first

      acum
    end
  end
end
