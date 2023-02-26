// Given a Binary Tree of size N, your task is to complete the function countNonLeafNodes(), 
//that should return the count of all the non-leaf nodes of the given binary tree.

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

	func countNonLeafNodes(_ node : Node?) -> Int {
		guard node != nil else {
			return 0
		}
		if node?.left == nil && node?.right == nil {
			return 0
		}
		var sum = 0
		if node?.left != nil {
			let leftCount = countNonLeafNodes(node?.left)
			sum += leftCount			
		}
		if node?.right != nil {
			let rightCount = countNonLeafNodes(node?.right)
			sum += rightCount
		}
		return sum + 1
	}
}

var t = BinaryTree()
t.root = Node(1)
t.root?.left = Node(2)
t.root?.right = Node(3)
t.root?.left?.left = Node(4)
t.root?.left?.right = Node(8)

let s = t.countNonLeafNodes(t.root)
print(s)