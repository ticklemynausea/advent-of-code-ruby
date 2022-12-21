require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day20 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        1
        2
        -3
        3
        -2
        0
        4
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 3 }
      let(:problem2_solution) { 1623178306 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 18257 }
    let(:problem2_solution) { 4148032160983 }
  end
end
