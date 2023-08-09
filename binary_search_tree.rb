# frozen_string_literal: true

# will represent the actual binary tree
class Tree
  attr_accessor :value

  def initialize(array)
    @value = array.sort.uniq
    @root = build_tree(value, 0, array.length)
  end

  def build_tree(array, start, finish)
    return nil if start > finish || start == array.length

    mid = (start + finish) / 2
    node = Node.new(array[mid])
    node.left = build_tree(array, start, mid - 1)
    node.right = build_tree(array, mid + 1, finish)
    node
  end

  def insert(value)
    previous = nil
    root = @root
    node = Node.new(value)
    return nil if root.data == node.data

    until root.nil?
      previous = root
      root = root.data > node.data ? root.left : root.right
    end
    previous.data > node.data ? previous.left = node : previous.right = node
  end

  def delete(value, node = @root)
    if node.data < value
      node.right = delete(value, node.right)
      return node
    elsif node.data > value
      node.left = delete(value, node.left)
      return node
    elsif node.left.nil? && node.right.nil? # if node has no children
      left = node.left
      right = node.right
      node = nil
      return left && right
    end

    # if node has child
    if node.left
      node.data = node.left.data
      node.left = nil
    else
      node.data = node.right.data
      node.right = nil
    end
    node
  end

  def find(value, node = @root)
    return if node.nil?

    node = node.data > value ? node.left : node.right until node.nil? || node.data == value
    node
  end

  def level_order(&block)
    return unless block_given?

    queue = [@root]
    until queue.empty?
      node = queue.shift
      block.call(node)
      queue.push(node.left) unless node.left.nil?
      queue.push(node.right) unless node.right.nil?
    end
  end

  # root, left, right
  def pre_order(node = @root, &block)
    return unless block_given?

    block.call(node)
    pre_order(node.left, &block) unless node.left.nil?
    pre_order(node.right, &block) unless node.right.nil?
  end

  # left, root, right
  def in_order(node = @root, &block)
    return unless block_given?

    in_order(node.left, &block) unless node.left.nil?
    block.call(node)
    in_order(node.right, &block) unless node.right.nil?
  end

  # left, right, root
  def post_order(node = @root, &block)
    return unless block_given?

    post_order(node.left, &block) unless node.left.nil?
    post_order(node.right, &block) unless node.right.nil?
    block.call(node)
  end

  # return number of edges in longest path from root to leaf node
  def height(node = @root)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)
    [left_height, right_height].max + 1
  end

  # return number of edges in path from a given node to the tree’s root node
  def depth(node, root = @root, count = 0)
    return -1 if node.nil?
    return count if root.data == node

    if root.data > node
      depth(node, root.left, count + 1)
    else
      depth(node, root.right, count + 1)
    end
  end

  # method to check if the tree is balanced
  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    
    # difference between heights of left and right subtree of every node is not more than 1
  end

  def rebalance
    # use traversal method to provide new array to build_tree method
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

# represents a node in the binary tree, containing the value and the link to the left and right children
class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
