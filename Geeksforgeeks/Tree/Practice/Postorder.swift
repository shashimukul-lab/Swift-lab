// Given a binary tree, find the Postorder Traversal of it.

class Node {
	var data : Int
	var left : Node?
	var right : Node?

	init(_ data : Int) {
		self.data = data
	}
}

struct BinaryTree {
	var root : Node?

	func postorder(_ node : Node?, _ res : inout [Int]) {
		if node == nil {
			return
		}
		postorder(node?.left, &res)
		postorder(node?.right, &res)
		res.append(node!.data)
	}
}

// var tree = BinaryTree()
// tree.root = Node(19)
// tree.root?.left = Node(10)
// tree.root?.right = Node(8)
// tree.root?.left?.left = Node(11)
// tree.root?.left?.right = Node(13)

// var r = [Int]()
// tree.postorder(tree.root, &r)
// print(r)

var tree = BinaryTree()
tree.root = Node(11)
tree.root?.left = Node(15)
tree.root?.left?.left = Node(7)

var r = [Int]()
tree.postorder(tree.root, &r)
print(r)