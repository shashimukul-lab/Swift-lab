// Given a Binary Search Tree. The task is to find the minimum valued element in this given BST.

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

	//Iterative
	// func minValue() -> Int? {
	// 	guard root != nil else {
	// 		return nil
	// 	}
	// 	var tmp = root
	// 	while let t = tmp?.left {
	// 		tmp = t
	// 	}
	// 	return tmp!.data
	// }

	//Recursively
	func minValue(_ node : Node?) -> Int? {
		guard node != nil else {
			return nil
		}
		if node?.left == nil {
			return node?.data
		}
		return minValue(node?.left)		
	}
}

var tree = BinarySearchTree()
tree.root = Node(5)
tree.root?.left = Node(4)
tree.root?.right = Node(6)
tree.root?.left?.left = Node(3)
tree.root?.right?.left = Node(7)
tree.root?.left?.left?.left = Node(1)

print(tree.minValue(tree.root)!)

// var tree = BinarySearchTree()
// tree.root = Node(9)
// tree.root?.right = Node(10)
// tree.root?.right?.right = Node(11)

// print(tree.minValue(tree.root)!)