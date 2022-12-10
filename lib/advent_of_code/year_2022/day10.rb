class AdventOfCode::Year2022::Day10
  STRENGTH_CYCLES = [20, 60, 100, 140, 180, 220].freeze

  CPU = Class.new do
    def initialize
      @cycle = 0
      @register = 1:wa

      @instruction = nil
      @instruction_clock = 0
    end

    def clock
      if instruction && instruction_clock == 0
        if instruction == "addx"
          register
      end
      yield
      self.clock += 1
      self.instruction_clock -= 1
    end

    def load(opcode, arg = nil)
      self.instruction = opcode
      self.arg = arg
      self.instruction_clock = { "addx" => 2, "noop" => 1}.fetch(opcode)
    end



    attr_accessor :cycle, :register, :instruction, :arg, :instruction_clock
  end

  def problem1
    cpu = CPU.new
    considered = []

    cpu.clock do |cycle|
      if cpu.instruction.nil?
        instruction = instructions.pop
        cpu.load(*instruction)
      end

      if STRENGTH_CYCLES.includes(cycle)
        considered << cpu.register
      end
    end

    puts STRENGTH_CYCLES.inspect
    puts considered.inspect
  end

  def problem2

  end

  def instructions
    @instructions ||= $stdin
      .map(&:chomp)
      .map { |line| line.split }
      .map { |a, b| [a, b.to_i] }
  end
end
