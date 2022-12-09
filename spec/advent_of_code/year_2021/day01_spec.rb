require "spec_helper"

RSpec.describe AdventOfCode::Year2021::Day01 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        199
        200
        208
        210
        200
        207
        240
        269
        260
        263
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 7 }
      let(:problem2_solution) { 5 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 1709 }
    let(:problem2_solution) { 1761 }
  end
end
