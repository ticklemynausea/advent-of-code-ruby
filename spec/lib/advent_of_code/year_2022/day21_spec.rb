require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day21 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        root: pppw + sjmn
        dbpl: 5
        cczh: sllz + lgvd
        zczc: 2
        ptdq: humn - dvpt
        dvpt: 3
        lfqf: 4
        humn: 5
        ljgn: 2
        sjmn: drzm * dbpl
        sllz: 4
        pppw: cczh / lfqf
        lgvd: ljgn * ptdq
        drzm: hmdt - zczc
        hmdt: 32
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 152 }
      let(:problem2_solution) { nil }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 158661812617812 }
    let(:problem2_solution) { nil }
  end
end
