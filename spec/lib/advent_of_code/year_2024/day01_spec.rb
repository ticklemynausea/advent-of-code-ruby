require "spec_helper"

RSpec.describe AdventOfCode::Year2024::Day01 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 11 }
      let(:problem2_solution) { 31 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 1319616 }
    let(:problem2_solution) { 27267728 }
  end
end
