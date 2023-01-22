// Given the root of a binary tree. Check whether it is a BST or not.
//Note: We are considering that BSTs can not contain duplicate Nodes.

class Node {
	var data : Int
	var left : Node?
	var right : Node?

	init(_ data : Int) {
		self.data = data
	}
}

extension Node {

}

struct BinarySearchTree {
	var root : Node?

	// func isBST() -> Bool {
	// 	return isBSTUtil(root, Int.min, Int.max)
	// }

	// func isBSTUtil(_ node : Node?, _ min : Int, _ max : Int) -> Bool {
	// 	guard let node = node else {
	// 		return true
	// 	}
	// 	if node.data < min || node.data > max {
	// 		return false
	// 	}
	// 	return isBSTUtil(node.left, min, node.data - 1) && isBSTUtil(node.right, node.data + 1, max)
	// }

	func isBST() -> Bool {
		var prev : Node? = nil
		return isBSTUtil(root, &prev)
	}

	func isBSTUtil(_ node : Node?, _ prev : inout Node?) -> Bool {
		guard let node = node else {
			return true
		}
		if !isBSTUtil(node.left, &prev) {
			return false
		}
		if let prev = prev, node.data <= prev.data {
			return false
		} 
		prev = node
		return isBSTUtil(node.right, &prev)
	}

	// func maxValue(_ node : Node?) -> Int? {
	// 	guard let node = node else {
	// 		return nil
	// 	}
	// 	let value = node.data
	// 	let leftMax = maxValue(node.left)
	// 	let rightMax = maxValue(node.right)
	// 	var max = value
	// 	if let leftMax = leftMax, leftMax > max {
	// 		max = leftMax
	// 	} 
	// 	if let rightMax = rightMax, rightMax > max {
	// 		max = rightMax
	// 	}
	// 	return max
	// }

	// func minValue(_ node : Node?) -> Int? {
	// 	guard let node = node else {
	// 		return nil
	// 	}
	// 	let value = node.data
	// 	let leftMin = minValue(node.left)
	// 	let rightMin = minValue(node.right)
	// 	var min = value
	// 	if let leftMin = leftMin, leftMin < min {
	// 		min = leftMin
	// 	}
	// 	if let rightMin = rightMin, rightMin < min {
	// 		min = rightMin
	// 	}
	// 	return min
	// }

	// func isBST(_ node : Node?) -> Bool {
	// 	guard let node = node else {
	// 		return true
	// 	}
	// 	if let l = node.left, node.data < maxValue(l)! {
	// 		return false
	// 	}
	// 	if let r = node.right, node.data > minValue(r)! {
	// 		return false
	// 	}
	// 	if !(isBST(node.left) && isBST(node.right)) {
	// 		return false
	// 	} 
	// 	return true
	// }

	// func isBST(_ node : Node?) -> Bool {
	// 	guard node != nil else {
	// 		return true
	// 	}
	// 	var r = [Int]()
	// 	inorder(node, &r)
	// 	if r.count == 1 {
	// 		return true
	// 	}
	// 	for i in 0..<r.count - 2 {
	// 		if r[i] > r[i + 1] {
	// 			return false
	// 		}
	// 	}
	// 	return true
	// }

	// func inorder(_ node : Node?, _ arr : inout [Int]) {
	// 	guard let node = node else {
	// 		return
	// 	}
	// 	inorder(node.left, &arr)
	// 	arr.append(node.data)
	// 	inorder(node.right, &arr)
	// }
}

var tree = BinarySearchTree()
tree.root = Node(2)
tree.root?.left = Node(1)
tree.root?.right = Node(3)
// tree.root?.left?.left = Node(7)
// tree.root?.left?.left?.left = Node(3)
// tree.root?.right?.left = Node(5)
// tree.root?.right?.right = Node(1)

let b = tree.isBST()
print(b)


// var tree = BinarySearchTree()
// tree.root = Node(2)
// tree.root?.right = Node(7)
// tree.root?.right?.right = Node(6)
// tree.root?.right?.right?.right = Node(5)
// tree.root?.right?.right?.right?.right = Node(9)
// tree.root?.right?.right?.right?.right?.right = Node(2)
// tree.root?.right?.right?.right?.right?.right?.right = Node(6)

// let b = tree.isBST(tree.root)
// print(b)


// var tree = BinarySearchTree()
// tree.root = Node(40)
// tree.root?.left = Node(30)
// tree.root?.right = Node(50)
// tree.root?.left?.left = Node(25)
// tree.root?.left?.right = Node(35)
// tree.root?.right?.left = Node(38)
// tree.root?.right?.right = Node(55)

// let max = tree.maxValue(tree.root)
// print(max!)
// let min = tree.minValue(tree.root)
// print(min!)

//var r = [Int]()
//tree.inorder(tree.root, &r)
//print(r)
//let b = tree.isBST()
//print(b)