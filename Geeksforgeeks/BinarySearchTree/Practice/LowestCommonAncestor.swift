// Given a Binary Search Tree (with all values unique) and two node values. Find the Lowest Common Ancestors of the two nodes in the BST.

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

	// func LCA(_ node : Node?, _ n1 : Int, _ n2 : Int) -> Node? {
	// 	guard let node = node else {
	// 		return nil
	// 	}
	// 	if node.data == n1 || node.data == n2 {
	// 		return node
	// 	}
	// 	if (n1 < node.data && n2 > node.data) || (n2 < node.data && n1 > node.data) {
	// 		return node
	// 	}
	// 	if n1 < node.data && n2 < node.data {
	// 		return LCA(node.left, n1, n2)
	// 	}
	// 	return LCA(node.right, n1, n2)
	// }

	//Iterative
	func LCA(_ node : Node?, _ n1 : Int, _ n2 : Int) -> Node? {
		var curr = node
		while let n = curr {
			if (n1 < n.data && n2 < n.data) {
				curr = n.left
			}
			else if (n1 > n.data && n2 > n.data) {
				curr = n.right
			} else {
				break
			}
		}
		return curr
	}

	//Recursive
	// func LCA(_ node : Node?, _ n1 : Int, _ n2 : Int) -> Node? {
	// 	guard let node = node else {
	// 		return nil
	// 	}
	// 	if n1 < node.data && n2 < node.data {
	// 		return LCA(node.left, n1, n2)
	// 	}
	// 	if n1 > node.data && n2 > node.data {
	// 		return LCA(node.right, n1, n2)	
	// 	}
	// 	return node
	// }

	mutating func insert(_ x : Int) {
		root = insert(root, x)
	}

	private func insert(_ node : Node?, _ x : Int) -> Node {
		guard let node = node else {
			return Node(x)
		}
		if x < node.data {
			node.left = insert(node.left, x)
		} else {
			node.right = insert(node.right, x)
		}
		return node
	}

	func inorder(_ node : Node?) {
		guard let node = node else {
			return
		}
		inorder(node.left)
		print(node.data)
		inorder(node.right)
	} 
}

// var tree = BinarySearchTree()
// tree.insert(5)
// tree.insert(4)
// tree.insert(6)
// tree.insert(3)
// tree.insert(7)
// tree.insert(8)
// tree.inorder(tree.root)
// if let n = tree.LCA(tree.root, 7, 8) {
// 	print("Node is")
// 	print(n.data)
// }

// var tree = BinarySearchTree()
// tree.insert(2)
// tree.insert(1)
// tree.insert(3)
// tree.inorder(tree.root)
// if let n = tree.LCA(tree.root, 1, 3) {
// 	print("Node is")
// 	print(n.data)
// }

var tree = BinarySearchTree()
tree.insert(20)
tree.insert(8)
tree.insert(22)
tree.insert(4)
tree.insert(12)
tree.insert(10)
tree.insert(14)
tree.inorder(tree.root)
if let n = tree.LCA(tree.root, 4, 12) {
	print("Node is")
	print(n.data)
}

