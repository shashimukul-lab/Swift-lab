// Given a Binary Search Tree and a node value X, find if the node with value X is present in the BST or not.

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
	// func search(_ node : Node?, x : Int) -> Bool {
	// 	guard node != nil else {
	// 		return false
	// 	}
	// 	var curr = node
	// 	while let n = curr {
	// 		if n.data == x {
	// 			return true
	// 		}
	// 		if x < n.data {
	// 			curr = n.left
	// 		} else {
	// 			curr = n.right
	// 		}
	// 	}
	// 	return false
	// }

	//Recursive
	func search(_ node : Node?, x : Int) -> Bool {
		guard node != nil else {
			return false
		}
		if node?.data == x {
			return true
		} 
		if x < node!.data {
			return search(node?.left, x : x)
		}
		if x > node!.data {
			return search(node?.right, x : x)
		}
		return false
	}
}

// var tree = BinarySearchTree()
// tree.root = Node(2)
// tree.root?.right = Node(81)
// tree.root?.right?.left = Node(42)
// tree.root?.right?.right = Node(87)
// tree.root?.right?.left?.right = Node(66)
// tree.root?.right?.left?.right?.left = Node(45)
// tree.root?.right?.right?.right = Node(90)
// //tree.root?.right?.right = Node(1)

// let res = tree.search(tree.root, x : 87)
// print(res)

var tree = BinarySearchTree()
tree.root = Node(6)
tree.root?.right = Node(8)
tree.root?.right?.left = Node(7)
tree.root?.right?.right = Node(9)
//tree.root?.right?.left?.right = Node(66)
//tree.root?.right?.left?.right?.left = Node(45)
//tree.root?.right?.right?.right = Node(90)
//tree.root?.right?.right = Node(1)

let res = tree.search(tree.root, x : 11)
print(res)


