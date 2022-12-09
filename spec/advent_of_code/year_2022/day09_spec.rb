require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day09 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        R 4
        U 4
        L 3
        D 1
        R 4
        D 1
        L 5
        R 2
      INPUT
    end

    describe "problem 1" do
      it "is correct" do
        expect(subject.problem1).to eq(13)
      end
    end

    describe "problem 2" do
      it "is correct" do
        expect(subject.problem2).to eq(1)
      end
    end
  end

  describe "example 2" do
    let(:input) do
      <<~INPUT
        R 5
        U 8
        L 8
        D 3
        R 17
        D 10
        L 25
        U 20
      INPUT
    end

    describe "problem 2" do
      it "is correct" do
        expect(subject.problem2).to eq(36)
      end
    end
  end

  describe "problem 1" do
    it "is correct" do
      expect(subject.problem1).to eq(6498)
    end
  end

  describe "problem 2" do
    it "is correct" do
      expect(subject.problem2).to eq(2531)
    end
  end
end
