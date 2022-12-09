class AdventOfCode::Year2022::Day07
  Node = Struct.new(:name, :zize, :children, keyword_init: true) do
    def dir?
      !children.nil?
    end

    def calculate_zize
      return zize unless zize.nil?

      self.zize = children.map(&:calculate_zize).inject(&:+)
    end
  end

  def problem1
    find_all_dirs(filesystem, max: 100_000).map(&:zize).inject(&:+)
  end

  def problem2
    target = 30_000_000 - (70_000_000 - filesystem.zize)
    find_all_dirs(filesystem, min: target).min { |a, b| a.zize <=> b.zize }.zize
  end

  def filesystem
    @filesystem ||= begin
      root_node = nil
      stack = []

      $stdin.each_line do |line|
        tokens = line.split

        if tokens[0] == "$" && tokens[1] == "cd"
          case tokens[2]
          when "/"
            root_node = Node.new(name: "/", children: [])
            stack.push(root_node)
          when ".."
            stack.pop
          else
            to = stack.last.children.find { |d| d.name == tokens[2] && d.zize.nil? }
            stack.push(to)
          end
        elsif tokens[0] == "$" && tokens[1] == "ls"
          next
        elsif tokens[0] == "dir"
          node = Node.new(name: tokens[1], zize: nil, children: [])
          stack.last.children.push(node)
          next
        else
          node = Node.new(name: tokens[1], zize: tokens[0].to_i, children: nil)
          stack.last.children.push(node)
        end
      end

      root_node.calculate_zize

      root_node
    end
  end

  def find_all_dirs(root, min: 0, max: Float::INFINITY)
    [].append(*root
      .children
      .filter(&:dir?)
      .filter { |d| d.zize.between?(min, max) }
      .flatten
      .append(*root
        .children
        .filter(&:dir?)
        .flat_map { |d| find_all_dirs(d, min:, max:) }))
  end
end
