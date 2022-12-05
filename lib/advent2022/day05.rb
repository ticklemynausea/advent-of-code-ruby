require "pry"

class Advent2022::Day05
  def problem1
    load_problem

    $stdin.each_line do |line|
      amount, from, to = line.scan(/(\d+)/).map { |r| r.first.to_i }
      puts "#{amount} #{from} #{to}"
      amount.times do
        stacks[to - 1].push(stacks[from - 1].pop)
      end
    end

    stacks.map(&:last).join
  end

  def problem2
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

  attr_reader :stacks
end

