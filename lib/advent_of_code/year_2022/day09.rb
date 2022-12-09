require "set"

class AdventOfCode::Year2022::Day09
  Rope = Struct.new(:h_x, :h_y, :t_x, :t_y) do
    def initialize(h_x = 0, h_y = 0, t_x = 0, t_y = 0)
      super
    end

    def move(direction)
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

      update_tail
    end

    def head_at
      [h_x, h_y]
    end

    def tail_at
      [t_x, t_y]
    end

    def update_tail
      d_x = h_x - t_x
      d_y = h_y - t_y

      if (d_x.abs == 1 && d_y.abs == 2) || ((d_x.abs == 2 && d_y.abs == 1) || (d_x.abs == 2 && d_y.abs == 2))
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
            "H"
          elsif y == t_y && x == t_x
            "T"
          elsif y.zero? && x.zero?
            "s"
          else
            "."
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

    def head_from_tail(rope)
      self.h_x = rope.t_x
      self.h_y = rope.t_y

      update_tail
    end
  end

  def problem1
    tail_visited = Set.new
    rope = Rope.new

    each_command do |direction, n|
      n.times do
        rope.move(direction)

        # rope.puts_repr
        # puts
        # rope.puts_repr
        # puts
        # puts
        tail_visited << rope.tail_at
      end
    end

    tail_visited.size
  end

  def problem2
    tail_visited = Set.new
    rope = 10.times.map { Rope.new }

    each_command do |direction, n|
      n.times do
        rope.first.move(direction)

        rope.each_cons(2) do |ahead, behind|
          behind.head_from_tail(ahead)
        end

        tail_visited << rope.last.head_at
      end
    end

    tail_visited.size
  end

  def each_command
    $stdin.each_line do |line|
      line.split.then do |d, n|
        yield(d, n.to_i)
      end
    end
  end
end
