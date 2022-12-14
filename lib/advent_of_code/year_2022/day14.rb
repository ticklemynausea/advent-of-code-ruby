# rubocop:disable all

class AdventOfCode::Year2022::Day14
  ORIGIN = 500

  Grid = Class.new do
    def initialize(paths_of_rock)
      @min_col, @max_col, @min_row, @max_row = paths_of_rock.flatten(1).then do |pairs|
        [
          pairs.map(&:first).min - 1000,
          pairs.map(&:first).max + 1000,
          pairs.map(&:last).min - 13,
          pairs.map(&:last).max + 2,
        ]
      end

      @grid = (min_row..max_row).map do |_row|
        (min_col..max_col).map do |_col|
          '.'
        end
      end

      paths_of_rock.each do |path_of_rock|
        path_of_rock.each_cons(2) do |(col_start, row_start), (col_end, row_end)|
          Range.new(*[row_start, row_end].sort).each do |row|
            Range.new(*[col_start, col_end].sort).each do |col|
              grid[row - min_row][col - min_col] = "#"
            end
          end
        end
      end

      (min_col..max_col).each do |col|
        set(max_row, col, "#")
      end
    end

    def drop_sand
      sand_row = min_row
      sand_col = ORIGIN

      loop do
        if at(sand_row + 1, sand_col) == "."
          sand_row += 1
        elsif at(sand_row + 1, sand_col - 1) == "."
          sand_row += 1
          sand_col -= 1
        elsif at(sand_row + 1, sand_col + 1) == "."
          sand_row += 1
          sand_col += 1
        else
          break
        end
      end

      set(sand_row, sand_col, 'o')
    end

    def at(row, col)
      grid[row - min_row][col - min_col]
    end

    def set(row, col, sym)
      grid[row - min_row][col - min_col] = sym
    end

    def puts_repr
      puts "(#{min_col},#{min_row}) (#{max_col},#{max_row})"
      print " " * 5
      (min_col..max_col).each { |col| print col == ORIGIN ? "v" : " " }
      puts
      grid.each.with_index(min_row) do |row, index|
        puts "#{index.to_s.rjust(4)} #{row.join}"
      end
    end

    attr_accessor :grid, :min_col, :max_col, :min_row, :max_row
  end

  def problem1
    grid = Grid.new(paths_of_rock)
    grid.puts_repr

    i = 0
    loop do
      grid.drop_sand

      i += 1
    end

  rescue => e
    puts e
    grid.puts_repr

    i
  end

  def problem2
    grid = Grid.new(paths_of_rock)
    grid.puts_repr

    i = 0
    until grid.at(0, 500) == 'o'
      grid.drop_sand

      i += 1
    end

    grid.puts_repr

    i
  end

  def paths_of_rock
    @paths_of_rock ||= $stdin.map do |line|
      line.split(" -> ").map { |sl| sl.split(",").map(&:to_i) }
    end
  end
end
