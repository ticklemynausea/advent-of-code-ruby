require "pry"

require_relative "advent2022/version"

Dir.glob(File.join("advent2022","day*.rb"), base: "lib").each do |r|
  require_relative r
end

module Advent2022
  class Error < StandardError; end
  # Your code goes here...

  def self.input_file_for(klass)
    day = klass.name.match(/::Day(\d+)/)[1]
    File.open("lib/advent2022/inputs/day#{day}.txt")
  end
end
