class AdventOfCode::Year2022::Day11
  Operation = Struct.new(:operator, :a, :b, :divisor, :monkey_if_true, :monkey_if_false) do
    def evaluate(worry_level)
      (a == "old" ? worry_level : a.to_i).send(operator, b == "old" ? worry_level : b.to_i)
    end

    def divisible?(worry_level)
      if worry_level % divisor == 0
        monkey_if_true
      else
        monkey_if_false
      end
    end
  end

  Item = Struct.new(:worry_level)

  Monkey = Struct.new(:id, :items, :operation, :inspections) do
    def initialize(id, items, operation, inspections = 0)
      super
    end
  end

  def problem1
    20.times { round(3) }

    monkeys.values
      .sort { |a, b| a.inspections <=> b.inspections }
      .then { |monkeys| monkeys[-1].inspections * monkeys[-2].inspections }
  end

  def problem2
    10000.times { round(1) }

    monkeys.values
      .sort { |a, b| a.inspections <=> b.inspections }
      .then { |monkeys| monkeys[-1].inspections * monkeys[-2].inspections }
  end

  def round(calming_divisor)
    lcm = monkeys.values.reduce(1) { |memo, monkey| memo * monkey.operation.divisor }

    monkeys.each do |_key, monkey|
      while (item = monkey.items.shift)
        monkey.inspections += 1

        item.worry_level = monkey.operation.evaluate(item.worry_level) / calming_divisor % lcm

        next_monkey = monkey.operation.divisible?(item.worry_level)

        monkeys[next_monkey].items << item
      end
    end
  end

  def monkeys
    @monkeys ||= $stdin.each_slice(7).each_with_object({}) do |input, monkeys|
      id = input[0].match(/^Monkey (\d+):$/)[1].to_i
      items = input[1].match(/^  Starting items: (.+)$/)[1].split(",").map(&:to_i)
        .map { |worry| Item.new(worry) }
      operator, a, b = input[2].match(/^  Operation: new = (.*) (.*) (.*)$/).then do |match|
        [match[2].to_sym, match[1], match[3]]
      end
      divisor = input[3].match(/^  Test: divisible by (\d+)/)[1].to_i
      monkey_if_true = input[4].match(/^    If true: throw to monkey (\d+)/)[1].to_i
      monkey_if_false = input[5].match(/^    If false: throw to monkey (\d+)/)[1].to_i

      operation = Operation.new(operator, a, b, divisor, monkey_if_true, monkey_if_false)
      monkey = Monkey.new(id, items, operation)

      monkeys[id] = monkey
    end
  end
end
