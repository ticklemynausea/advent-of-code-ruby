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
      let(:problem2_solution) { "((4 + (2 * (X - 3))) / 4) = 150" } # 💩
      # let(:problem2_solution) { 301 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 158661812617812 }
    let(:problem2_solution) { "((52972860789663 - (((19 * (55 + (((((780 + (((15 * (((((118 + (2 * ((((((((((((2 * ((((((10 * ((((((((2 * ((((((2 * ((28 * ((((((((68 + ((((203 + X) / 2) - 777) * 57)) * 2) - 971) / 11) - 246) + 6) / 7) + 918)) - 665)) + 488) / 3) + 794) / 7) - 900)) + 735) * 5) - 154) / 3) + 691) / 2) - 141)) - 815) / 3) + 475) * 2) - 112)) + 13) / 7) - 203) / 8) + 773) * 48) + 166) * 2) - 182) / 6) - 142))) / 3) - 137) / 5) + 289)) - 144) * 2)) / 12) - 820) + 737) / 2))) + 244) / 5)) * 2) = 52716091087786" } # 💩
    #let(:problem2_solution) { 3352886133831 }
  end
end
