require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day15 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        10
        20
        Sensor at x=2, y=18: closest beacon is at x=-2, y=15
        Sensor at x=9, y=16: closest beacon is at x=10, y=16
        Sensor at x=13, y=2: closest beacon is at x=15, y=3
        Sensor at x=12, y=14: closest beacon is at x=10, y=16
        Sensor at x=10, y=20: closest beacon is at x=10, y=16
        Sensor at x=14, y=17: closest beacon is at x=10, y=16
        Sensor at x=8, y=7: closest beacon is at x=2, y=10
        Sensor at x=2, y=0: closest beacon is at x=2, y=10
        Sensor at x=0, y=11: closest beacon is at x=2, y=10
        Sensor at x=20, y=14: closest beacon is at x=25, y=17
        Sensor at x=17, y=20: closest beacon is at x=21, y=22
        Sensor at x=16, y=7: closest beacon is at x=15, y=3
        Sensor at x=14, y=3: closest beacon is at x=15, y=3
        Sensor at x=20, y=1: closest beacon is at x=15, y=3
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 26 }
      let(:problem2_solution) { 56_000_011 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 5_716_881 }
    let(:problem2_solution) { 10_852_583_132_904 }
  end

  describe ".aggregate" do
    let(:case1) { [[0, 8], [9, 11], [9, 19], [11, 13], [14, 20], [15, 20]] }
    let(:case2) { [[0, 9], [8, 12], [10, 18], [13, 20], [16, 20]] }
    let(:case3) { [[0, 10], [13, 20]] }

    it "do" do
      expect(subject.aggregate(case1)).to eq([[0, 20]])
      expect(subject.aggregate(case2)).to eq([[0, 20]])
      expect(subject.aggregate(case3)).to eq([[0, 10], [13, 20]])
    end
  end
end
