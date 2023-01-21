// Given a binary tree of size N, you have to count number of nodes in it.


class Node {
	var data : Int
	var left : Node?
	var right : Node?

	init(_ data : Int) {
		self.data = data
		self.left = nil
		self.right = nil
	}
}

struct BinaryTree {
	var root : Node?

	var size : Int {
		return count(root)
	}

	private func count(_ node : Node?) -> Int {
		guard node != nil else {
			return 0
		}
		return count(node?.left) + 1 + count(node?.right)
	}
}

// var tree = BinaryTree()
// tree.root = Node(1)
// tree.root?.left = Node(2)
// tree.root?.right = Node(3)

// print(tree.size)

var tree = BinaryTree()
tree.root = Node(10)
tree.root?.left = Node(5)
tree.root?.right = Node(9)
tree.root?.left?.right = Node(1)
tree.root?.right?.left = Node(3)
tree.root?.right?.right = Node(6)

print(tree.size)