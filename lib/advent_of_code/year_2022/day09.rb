require "set"

class AdventOfCode::Year2022::Day09
  Rope = Struct.new(:h_x, :h_y, :t_x, :t_y) do
    def initialize(h_x = 0, h_y = 0, t_x = 0, t_y = 0)
      super
    end

    def move_head(direction)
      case direction
      when "U"
        self.h_y += 1
      when "D"
        self.h_y -= 1
      when "L"
        self.h_x -= 1
      when "R"
        self.h_x += 1
      end
    end

    def tail_at
      [t_x, t_y]
    end

    def update_tail
      d_x = h_x - t_x
      d_y = h_y - t_y

      if (d_x.abs == 1 && d_y.abs == 2) || (d_x.abs == 2 && d_y.abs == 1)
        self.t_x += d_x <=> 0
        self.t_y += d_y <=> 0
      elsif d_x.abs == 2
        self.t_x += d_x <=> 0
      elsif d_y.abs == 2
        self.t_y += d_y <=> 0
      end
    end

    def repr
      x_rng = [[0, h_x, t_x].min - 2, [0, h_x, t_x].max + 2]
      y_rng = [[0, h_y, t_y].min - 2, [0, h_y, t_y].max + 2]

      iter_x = Range.new(*x_rng)
      iter_y = Range.new(*y_rng)

      iter_y.map do |y|
        iter_x.map do |x|
          if y == h_y && x == h_x
            'H'
          elsif y == t_y && x == t_x
            'T'
          elsif y == 0 && x == 0
            's'
          else
            '.'
          end
        end
      end
    end

    def puts_repr
      repr.each do |row|
        row.each do |c|
          print c
        end
        puts
      end
    end
  end

  def problem1
    tail_visited = Set.new
    rope = Rope.new

    each_command do |direction, n|
      n.times do
        rope.move_head(direction)

        # rope.puts_repr
        # puts
        rope.update_tail
        # rope.puts_repr
        # puts
        # puts
        tail_visited << rope.tail_at
      end
    end

    tail_visited.size
  end

  def problem2
  end

  def each_command
    $stdin.each_line do |line|
      line.split.then do |d, n|
        yield(d, n.to_i)
      end
    end
  end
end
