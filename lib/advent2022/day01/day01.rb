module Advent2022
  module Day01
    class << self
      def elves_total
        elves = [0]

        STDIN.each do |line|
          if line.chomp.empty?
            elves << 0
          else
            elves.push(elves.pop + line.to_i)
          end
        end

        elves
      end

      def problem1
        puts elves_total.max
      end

      def problem2
        puts elves_total.sort.last(3).inject(&:+)
      end
    end
  end
end
