require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day09 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        R 4
        U 4
        L 3
        D 1
        R 4
        D 1
        L 5
        R 2
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 13 }
      let(:problem2_solution) { 1 }
    end
  end

  describe "example 2" do
    let(:input) do
      <<~INPUT
        R 5
        U 8
        L 8
        D 3
        R 17
        D 10
        L 25
        U 20
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem2_solution) { 36 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 6498 }
    let(:problem2_solution) { 2531 }
  end
end
