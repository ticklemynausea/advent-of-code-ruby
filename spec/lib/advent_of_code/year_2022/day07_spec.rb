require "spec_helper"

RSpec.describe AdventOfCode::Year2022::Day07 do
  subject { described_class.new }

  describe "example" do
    let(:input) do
      <<~INPUT
        $ cd /
        $ ls
        dir a
        14848514 b.txt
        8504156 c.dat
        dir d
        $ cd a
        $ ls
        dir e
        29116 f
        2557 g
        62596 h.lst
        $ cd e
        $ ls
        584 i
        $ cd ..
        $ cd ..
        $ cd d
        $ ls
        4060174 j
        8033020 d.log
        5626152 d.ext
        7214296 k
      INPUT
    end

    it_behaves_like "daily problem" do
      let(:problem1_solution) { 95_437 }
      let(:problem2_solution) { 24_933_642 }
    end

    it "calculates size" do
      expect(subject.filesystem.zize).to eq(48_381_165)
    end
  end

  it_behaves_like "daily problem" do
    let(:problem1_solution) { 1_086_293 }
    let(:problem2_solution) { 366_028 }
  end
end
