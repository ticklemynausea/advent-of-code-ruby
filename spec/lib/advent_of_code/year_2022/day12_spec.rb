require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day12 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        Sabqponm
        abcryxxl
        accszExk
        acctuvwj
        abdefghi
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 31 }
      let(:problem2_solution) { 29 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 520 }
    let(:problem2_solution) { 508 }
  end
end
