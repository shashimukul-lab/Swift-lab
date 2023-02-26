// Given a Binary Tree of size N, your task is to complete the function sumBt(), that should return the sum of all the nodes of the given binary tree.

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

	func sumBt(_ node : Node?) -> Double {
		guard node != nil else {
			return 0.0
		}
		return Double(sumBt(node?.left)) + Double(node!.data) + Double(sumBt(node?.right))
	}
}

// var t = BinaryTree()
// t.root = Node(1)
// t.root?.left = Node(2)

// let sum = t.sumBt(t.root)
// print(sum)

var t = BinaryTree()
t.root = Node(1)
t.root?.left = Node(2)
t.root?.right = Node(3)
t.root?.right?.left = Node(3)

let sum = t.sumBt(t.root)
print(sum)