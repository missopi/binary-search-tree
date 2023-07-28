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
    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid-1)
    root.right = build_tree(array, mid+1, finish)
    root
  end

  def insert(value)
    node = @root
    return 'Value is equal to another value already present.' if value == node.value
    
    if value < node.value
        # move to left subtree
        # once node is reached insert node to left or right based on relationship between value and node value
    else
        # move to right subtree
        # once node is reached insert node to left or right based on relationship between value and node value
    end
  end

  def delete(value)
    # return nil is value doesn't exist
  end

  def find(value)
    # return nil is value not found

    # go through each to value to end or when value == node value
    # return node with given value
  end

  def level_order(&block)
    # return array of values if no block is given

    # breadth-first level order
    # yield each node to provided block
    # use array as a queue (FIFO)
  end

  def pre_order(&block)
    # return array of values if no block is given

    # traverse tree in pre_order depth-first order
    # yield each node to provided block
  end

  def in_order(&block)
    # return array of values if no block is given

    # traverse tree in in_order depth-first order
    # yield each node to provided block
  end

  def post_order(&block)
    # return array of values if no block is given

    # traverse tree in post_order depth-first order
    # yield each node to provided block
  end

  def height(node)
    # return number of edges in longest path from given node to leaf node
  end

  def depth(node)
    # return number of edges in path from a given node to the tree’s root node
  end

  # method to check if the tree is balanced
  def balanced?
    # difference between heights of left and right subtree of every node is not more than 1
  end

  def rebalance
    # use traversal method to provide new array to build_tree method
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

# represents a node in the binary tree, containing the value and the link to the left and right children
class Node
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end