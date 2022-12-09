require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day01 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        1000
        2000
        3000

        4000

        5000
        6000

        7000
        8000
        9000

        10000
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 24000 }
      let(:problem2_solution) { 45000 }
    end

    it "calculates elves' total" do
      expect(subject.elves_total.max).to eq(24000)
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 68442 }
    let(:problem2_solution) { 204837 }
  end
end
