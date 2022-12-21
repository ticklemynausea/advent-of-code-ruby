class AdventOfCode::Year2022::Day21
  def problem1
    collapse1("root")
  end

  def problem2
    _op, left, right = input["root"]

    "#{collapse2(left)} = #{collapse2(right)}"
  end

  def collapse1(node)
    value = input[node]

    return value if value.is_a?(Integer)

    op, val1, val2 = value

    collapse1(val1).send(op, collapse1(val2))
  end

  def collapse2(node)
    value = input[node]

    return "X" if node == "humn"
    return value if value.is_a?(Integer)

    op, val1, val2 = value

    lhs = collapse2(val1)
    rhs = collapse2(val2)

    return lhs.send(op, rhs) if lhs.is_a?(Integer) && rhs.is_a?(Integer)

    "(#{lhs} #{op} #{rhs})"

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
