class AdventOfCode::Year2022::Day21
  def problem1
    collapse("root")
  end

  def problem2
  end

  def collapse(node)
    value = input[node]

    return value if value.is_a?(Integer)

    op, val1, val2 = value

    collapse(val1).send(op, collapse(val2))
  end

  def input
    @input ||= $stdin.each_with_object({}) do |str, memo|
      key, val1, op, val2 = str.match(/(\w+): (\w+)(?: (.)? (\w+)?)?/)[1..4]

      if op.nil?
        memo[key] = val1.to_i
      else
        memo[key] = [op.to_sym, val1, val2]
      end
    end
  end
end
