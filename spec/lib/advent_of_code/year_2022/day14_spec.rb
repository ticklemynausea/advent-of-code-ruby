require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day14 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        498,4 -> 498,6 -> 496,6
        503,4 -> 502,4 -> 502,9 -> 494,9
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 24 }
      let(:problem2_solution) { 93 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 888 }
    let(:problem2_solution) { 26461 }
  end
end
