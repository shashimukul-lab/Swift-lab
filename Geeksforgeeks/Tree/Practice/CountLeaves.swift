// Given a Binary Tree of size N , You have to count leaves in it.

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

	func inorder(_ node : Node?) {
		guard node != nil else {
			return
		}
		inorder(node?.left)
		print(node!.data)
		inorder(node?.right)
	}

	func countLeaves(_ node : Node?) -> Int {
		guard node != nil else {
			return 0
		}
		guard node?.left != nil, node?.right != nil else {
			return 1
		}
		var leftCount = 0
		var rightCount = 0
		if node?.left != nil {
			leftCount = countLeaves(node?.left)
		}
		if node?.right != nil {
			rightCount = countLeaves(node?.right)
		}
		return leftCount + rightCount
	}
}

// var tree = BinaryTree()
// tree.root = Node(1)
// tree.root?.left = Node(10)
// tree.root?.right = Node(39)
// tree.root?.left?.left = Node(5)
// //tree.root?.left?.right = Node(60)
// //tree.root?.right?.left = Node(50)

// let l = tree.countLeaves(tree.root)
// print(l)

var tree = BinaryTree()
tree.root = Node(4)
tree.root?.left = Node(8)
tree.root?.right = Node(10)
tree.root?.left?.left = Node(7)
tree.root?.left?.left?.left = Node(3)
tree.root?.right?.left = Node(5)
tree.root?.right?.right = Node(1)

let l = tree.countLeaves(tree.root)
print(l)














