class AdventOfCode::Year2022::Day10
  STRENGTH_CYCLES = [20, 60, 100, 140, 180, 220].freeze

  CPU = Class.new do
    def initialize
      @cycle = 0
      @register = 1
      @counter = 1
    end

    def each_cycle(operation, operand)
      case operation
      when "addx"
        2.times do
          self.cycle += 1
          yield cycle, register
        end
        self.register += operand

      when "noop"
        self.cycle += 1
        yield cycle, register
      end
    end

    attr_accessor :cycle, :register, :counter
  end

  def problem1
    cpu = CPU.new
    values = []

    each_command do |operation, operand|
      cpu.each_cycle(operation, operand) do |cycle, register|
        values << register if STRENGTH_CYCLES.include?(cycle)
      end
    end

    values.zip(STRENGTH_CYCLES).reduce(0) do |acc, (value, cycle)|
      acc + (value * cycle)
    end
  end

  def problem2
    cpu = CPU.new
    pixels = []

    each_command do |operation, operand|
      cpu.each_cycle(operation, operand) do |cycle, register|
        pixel = cycle - 1
        pixels[pixel] =
          if (pixel % 40).between?(register - 1, register + 1)
            "#"
          else
            "."
          end
      end
    end

    "#{pixels.each_slice(40).map(&:join).join("\n")}\n"
  end

  def each_command
    $stdin.each_line do |line|
      line.split.then do |d, n|
        yield(d, n.to_i)
      end
    end
  end
end
