require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day01 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        1000
        2000
        3000

        4000

        5000
        6000

        7000
        8000
        9000

        10000
      INPUT
    end

    it "calculates elves' total" do
      expect(subject.elves_total.max).to eq(24000)
    end
  end

  describe "problem 1" do
    it "is correct" do
      expect(subject.problem1).to eq(68442)
    end
  end

  describe "problem 2" do
    it "is correct" do
      expect(subject.problem2).to eq(204837)
    end
  end
end
