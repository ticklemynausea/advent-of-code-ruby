require "spec_helper"

RSpec.describe AdventOfCode::Year2021::Day02 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        forward 5
        down 5
        forward 8
        up 3
        down 8
        forward 2
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 150 }
      let(:problem2_solution) { 900 }
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 1_636_725 }
    let(:problem2_solution) { 1_872_757_425 }
  end
end
