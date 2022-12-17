require "pry"
require "byebug"
require "pry-byebug"

Dir.glob(File.join("advent_of_code", "**", "*.rb"), base: "lib").sort.each do |r|
  require_relative r
end

module AdventOfCode
  class Error < StandardError; end
  # Your code goes here...

  def self.input_file_for(klass)
    year, day = klass.name.match(/^AdventOfCode::Year(\d+)::Day(\d+)/)[1..2]
    File.open("lib/advent_of_code/year_#{year}/inputs/day#{day}.txt")
  end
end
