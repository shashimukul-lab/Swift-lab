// Given a binary tree, find its preorder traversal.

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

	func preorder(_ node : Node?, _ res : inout [Int]) {
		guard node != nil else {
			return
		}
		res.append(node!.data)
		preorder(node?.left, &res)
		preorder(node?.right, &res)
	} 
}

// var tree = BinaryTree()
// tree.root = Node(1)
// tree.root?.left = Node(4)
// tree.root?.left?.left = Node(4)
// tree.root?.left?.right = Node(2)

var tree = BinaryTree()
tree.root = Node(6)
tree.root?.left = Node(3)
tree.root?.right = Node(2)
tree.root?.left?.right = Node(1)
tree.root?.right?.left = Node(2)

var r = [Int]()
tree.preorder(tree.root, &r)
print(r) 