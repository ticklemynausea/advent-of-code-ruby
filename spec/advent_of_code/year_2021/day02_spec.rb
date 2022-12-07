require "spec_helper"

RSpec.describe AdventOfCode::Year2021::Day02 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        forward 5
        down 5
        forward 8
        up 3
        down 8
        forward 2
      INPUT
    end

    it "problem 1 solves example" do
      expect(subject.problem1).to eq(150)
    end

    it "problem 2 solves example" do
      expect(subject.problem2).to eq(900)
    end
  end

  describe "problem 1" do
    it "is correct" do
      expect(subject.problem1).to eq(1636725)
    end
  end

  describe "problem 2" do
    it "is correct" do
      expect(subject.problem2).to eq(1872757425)
    end
  end
end
