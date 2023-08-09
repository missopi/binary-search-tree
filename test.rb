require_relative ' binary_search_tree.rb'

test = Tree.new(Array.new(15) { rand(1..100) })
puts test.balanced?
puts 'Level Order: '
test.level_order { |node| print "#{node.data} " }; print "\n"
puts 'Pre Order: '
test.pre_order  { |node| print "#{node.data} " }; print "\n"
puts 'In Order: '
test.in_order { |node| print "#{node.data} " }; print "\n"
puts 'Post Order: '
test.post_order { |node| print "#{node.data} " }; print "\n"
test.insert(147)
test.insert(100)
test.insert(136)
test.insert(190)
test.insert(158)
puts test.balanced?
test.rebalance
puts test.balanced?
puts 'Level Order: '
test.level_order { |node| print "#{node.data} " }; print "\n"
puts 'Pre Order: '
test.pre_order  { |node| print "#{node.data} " }; print "\n"
puts 'In Order: '
test.in_order { |node| print "#{node.data} " }; print "\n"
puts 'Post Order: '
test.post_order { |node| print "#{node.data} " }; print "\n"