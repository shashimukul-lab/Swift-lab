// Given a Binary Tree, find the In-Order Traversal of it.

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

	func inorder(_ node : Node?, _ res : inout [Int]) {
		guard node != nil else {
			return
		}
		inorder(node?.left, &res)
		res.append(node!.data)
		inorder(node?.right, &res)
	}
}

// var tree = BinaryTree()
// tree.root = Node(1)
// tree.root?.left = Node(3)
// tree.root?.right = Node(2)

// var r = [Int]()
// tree.inorder(tree.root, &r)
// print(r)

var tree = BinaryTree()
tree.root = Node(10)
tree.root?.left = Node(20)
tree.root?.right = Node(30)
tree.root?.left?.left = Node(40)
tree.root?.left?.right = Node(60)
tree.root?.right?.left = Node(50)

var r = [Int]()
tree.inorder(tree.root, &r)
print(r)