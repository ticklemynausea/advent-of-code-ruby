require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day02 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        A Y
        B X
        C Z
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 15 }
      let(:problem2_solution) { 12 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 12_794 }
    let(:problem2_solution) { 14_979 }
  end
end
