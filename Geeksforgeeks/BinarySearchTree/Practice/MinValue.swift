// Given a Binary Search Tree. The task is to find the minimum element in this given BST. 

class Node {
	var data : Int
	var left : Node?
	var right : Node?

	init(_ data : Int) {
		self.data = data
	}
}

struct BinarySearchTree {
	var root : Node?

	// Iterative
	// func minValue(_ node : Node?) -> Int? {
	// 	guard var node = node else {
	// 		return nil		
	// 	}
	// 	while let l = node.left {
	// 		node = l
	// 	}
	// 	return node.data
	// }

	// Recursive
	func minValue(_ node : Node?) -> Int? {
		guard let node = node else {
			return nil		
		}
		if node.left == nil {
			return node.data
		}
		return minValue(node.left)
	}
}

var tree = BinarySearchTree()
tree.root = Node(5)
tree.root?.left = Node(4)
tree.root?.right = Node(6)
tree.root?.left?.left = Node(3)
tree.root?.left?.left?.left = Node(1)
//tree.root?.right?.left = Node(5)
tree.root?.right?.right = Node(7)

let m = tree.minValue(tree.root)
print(m!)

// var tree = BinarySearchTree()
// tree.root = Node(9)
// //tree.root?.left = Node(4)
// tree.root?.right = Node(10)
// //tree.root?.left?.left = Node(3)
// //tree.root?.left?.left?.left = Node(1)
// //tree.root?.right?.left = Node(5)
// tree.root?.right?.right = Node(11)

// let m = tree.minValue(tree.root)
// print(m!)