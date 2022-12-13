require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day13 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        [1,1,3,1,1]
        [1,1,5,1,1]

        [[1],[2,3,4]]
        [[1],4]

        [9]
        [[8,7,6]]

        [[4,4],4,4]
        [[4,4],4,4,4]

        [7,7,7,7]
        [7,7,7]

        []
        [3]

        [[[]]]
        [[]]

        [1,[2,[3,[4,[5,6,7]]]],8,9]
        [1,[2,[3,[4,[5,6,0]]]],8,9]
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 13 }
      let(:problem2_solution) { nil }
    end
  end

  describe "example" do
    let(:input) do
      <<~INPUT
      [[1,2,3,4], [], 2]
      [[1,2,3,4], [], 1]
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 0 }
      let(:problem2_solution) { nil }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 6086 }
    let(:problem2_solution) { nil }
  end
end
