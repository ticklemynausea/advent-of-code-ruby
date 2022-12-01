module Advent2022
  module Day01
    class << self
      def problem1
        elves = [0]

        STDIN.each do |line|
          if line.chomp.empty?
            elves << 0
          else
            elves.push(elves.pop + line.to_i)
          end
        end

        puts elves.max
      end
    end
  end
end
