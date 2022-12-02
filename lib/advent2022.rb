# frozen_string_literal: true

require_relative "advent2022/version"
Dir.glob(File.join("advent2022","day*.rb"), base: "lib").each do |r|
  require_relative r
end

module Advent2022
  class Error < StandardError; end
  # Your code goes here...
end
