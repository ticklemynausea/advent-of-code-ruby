require "spec_helper"

RSpec.describe Advent2022::Day02 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        A Y
        B X
        C Z
      INPUT
    end

    it "problem 1 gives correct result" do
      expect(subject.problem1).to eq(15)
    end

    it "problem 2 gives correct result" do
      expect(subject.problem2).to eq(12)
    end

  end

  describe "problem 1" do
    it "is correct" do
      expect(subject.problem1).to eq(12794)
    end
  end

  describe "problem 2" do
    it "is correct" do
      expect(subject.problem2).to eq(14979)
    end
  end
end
