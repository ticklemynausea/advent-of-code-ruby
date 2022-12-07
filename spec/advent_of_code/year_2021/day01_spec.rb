require "spec_helper"

RSpec.describe AdventOfCode::Year2021::Day01 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        199
        200
        208
        210
        200
        207
        240
        269
        260
        263
      INPUT
    end

    it "does something with the example input" do
      expect(subject.problem1).to eq(7)
    end
  end

  describe "problem 1" do
    it "is correct" do
      expect(subject.problem1).to eq(1709)
    end
  end

  describe "problem 2" do
    it "is correct" do
      expect(subject.problem2).to eq(1761)
    end
  end
end
