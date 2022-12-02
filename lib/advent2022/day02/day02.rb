class Advent2022::Day02
  def problem1
    totals = $stdin.map do |line|
      op, me = line.split
      shape_score(me) + play_score(op, me)
    end

    puts totals.inject(&:+)
  end

  def problem2
    totals = $stdin.map do |line|
      op, res = line.split
      me = desired_play(op, res)
      shape_score(me) + play_score(op, me)
    end

    puts totals.inject(&:+)
  end

  private

  def shape_score(me)
    { "X" => 1, "Y" => 2, "Z" => 3 }.fetch(me)
  end

  def play_score(op, me)
    return 0 if ["A Z", "B X", "C Y"].find { |s| s == "#{op} #{me}" }
    return 3 if ["A X", "B Y", "C Z"].find { |s| s == "#{op} #{me}" }

    6
  end

  def desired_play(op, res)
    return "X" if ["A Y", "B X", "C Z"].find { |s| s == "#{op} #{res}" }
    return "Y" if ["A Z", "B Y", "C X"].find { |s| s == "#{op} #{res}" }

    "Z"
  end
end
