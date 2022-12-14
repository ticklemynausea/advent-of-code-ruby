require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day08 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        30373
        25512
        65332
        33549
        35390
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 21 }
      let(:problem2_solution) { 8 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 1809 }
    let(:problem2_solution) { 479_400 }
  end

  describe ".visible_indexes" do
    it "is correct" do
      expect(subject.visible_indexes([9, 1, 2, 3, 4, 5])).to eq([0])
      expect(subject.visible_indexes([6, 5, 4, 3, 2, 1])).to eq([0])
      expect(subject.visible_indexes([1, 2, 3, 4, 5, 9])).to eq([0, 1, 2, 3, 4, 5])
      expect(subject.visible_indexes([1, 2, 1, 3, 1, 4])).to eq([0, 1, 3, 5])
    end
  end

  describe ".count_until_larger_than_first" do
    it "is correct" do
      expect(subject.count_until_larger_than_first([5, 4, 3, 2, 1])).to eq(4)
      expect(subject.count_until_larger_than_first([5, 5, 3, 2, 1])).to eq(1)
      expect(subject.count_until_larger_than_first([5, 5, 5, 2, 1])).to eq(1)
      expect(subject.count_until_larger_than_first([2, 5, 5, 2, 1])).to eq(1)
      expect(subject.count_until_larger_than_first([1, 2, 3, 4, 6])).to eq(1)
      expect(subject.count_until_larger_than_first([8, 7, 6, 9, 5])).to eq(3)
    end
  end
end
