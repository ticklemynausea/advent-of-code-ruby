require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day11 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        Monkey 0:
          Starting items: 79, 98
          Operation: new = old * 19
          Test: divisible by 23
            If true: throw to monkey 2
            If false: throw to monkey 3

        Monkey 1:
          Starting items: 54, 65, 75, 74
          Operation: new = old + 6
          Test: divisible by 19
            If true: throw to monkey 2
            If false: throw to monkey 0

        Monkey 2:
          Starting items: 79, 60, 97
          Operation: new = old * old
          Test: divisible by 13
            If true: throw to monkey 1
            If false: throw to monkey 3

        Monkey 3:
          Starting items: 74
          Operation: new = old + 3
          Test: divisible by 17
            If true: throw to monkey 0
            If false: throw to monkey 1
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 10605 }
      let(:problem2_solution) { 2713310158 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 66124 }
    let(:problem2_solution) { 19309892877 }
  end
end
