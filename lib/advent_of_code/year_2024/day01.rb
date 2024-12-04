class AdventOfCode::Year2024::Day01
  def problem1 = list_a.sort.zip(list_b.sort).map { |a, b| (a - b).abs }.sum

  def problem2 = list_a.map { |a| list_b.count(a) * a }.sum

  def list_a = lists.first

  def list_b = lists.last

  def lists = @lists ||= $stdin.map { |l| l.split.map(&:to_i) }.transpose
end
