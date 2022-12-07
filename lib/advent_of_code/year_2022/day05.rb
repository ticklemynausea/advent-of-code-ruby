class AdventOfCode::Year2022::Day05
  def problem1
    load_problem

    each_command do |amount, from, to|
      stacks[to - 1].push(*stacks[from - 1].pop(amount).reverse)
    end

    stacks.map(&:last).join
  end

  def problem2
    load_problem

    each_command do |amount, from, to|
      stacks[to - 1].push(*stacks[from - 1].pop(amount))
    end

    stacks.map(&:last).join
  end

  private

  def load_problem
    rows = []
    $stdin.each do |line|
      break if line == "\n"

      row = line.scan(/.{3,4}/).map { |t| t.scan(/\[(.*)\]/).first&.first }
      rows << row if row.any?(&:itself)
    end

    length = rows.map(&:length).max

    rows.each do |row|
      (length - row.length).times { row << nil }
    end

    @stacks = rows.transpose.map { |row| row.filter(&:itself).reverse }
  end

  def each_command
    $stdin.each_line do |line|
      amount, from, to = line.scan(/(\d+)/).map { |r| r.first.to_i }
      yield(amount, from, to)
    end
  end

  attr_reader :stacks
end
