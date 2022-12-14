class AdventOfCode::Year2022::Day14
  ORIGIN = 500

  def problem1
    initial_stones

    max_row = stones.max_by(&:first).first

    while drop_sand(max_row)
      # repr
      # puts
    end

    stones.count - initial_stones.count
  end

  def problem2
    max_row = stones.max_by(&:first).first + 2
    Range.new(stones.min_by(&:last).last - 1000, stones.max_by(&:last).last + 1000).each do |col|
      stones << [max_row, col]
    end

    initial_stones

    until stones.include?([0, 500])
      # repr
      # puts
      drop_sand(max_row)
    end

    stones.count - initial_stones.count
  end

  def drop_sand(max_row)
    row = 0
    col = ORIGIN

    while row <= max_row
      if !stones.include?([row + 1, col])
        row += 1
      elsif !stones.include?([row + 1, col - 1])
        row += 1
        col -= 1
      elsif !stones.include?([row + 1, col + 1])
        row += 1
        col += 1
      else
        stones << [row, col]
        break
      end
    end

    row <= max_row
  end

  def repr
    Range.new(stones.min_by(&:first).first - 10, stones.max_by(&:first).first + 10).each do |row|
      Range.new(stones.min_by(&:last).last - 10, stones.max_by(&:last).last + 10).each do |col|
        if stones.include?([row, col])
          if initial_stones.include?([row, col])
            print "#"
          else
            print "o"
          end
        else
          print "."
        end
      end
      puts
    end
  end

  def initial_stones
    @initial_stones ||= stones.dup
  end

  def stones
    @stones ||= Set.new(paths_of_rock.flat_map do |path_of_rock|
      path_of_rock.each_cons(2).flat_map do |(col_start, row_start), (col_end, row_end)|
        Range.new(*[row_start, row_end].sort).flat_map do |row|
          Range.new(*[col_start, col_end].sort).map do |col|
            [row, col]
          end
        end
      end
    end)
  end

  def paths_of_rock
    @paths_of_rock ||= $stdin.map do |line|
      line.split(" -> ").map { |sl| sl.split(",").map(&:to_i) }
    end
  end
end
