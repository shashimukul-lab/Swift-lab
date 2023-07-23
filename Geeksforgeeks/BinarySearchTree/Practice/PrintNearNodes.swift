// Given a Binary Search Tree and a range [low, high]. Find all the numbers in the BST that lie in the given range.
// Note: Element greater than or equal to root go to the right side.

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
}

class Solution {

	func printNearNodes(_ node : Node?, _ low : Int, _ high : Int) -> [Int] {
		guard node != nil else {
			return []
		}
		var arr = [Int]()
		inorder(node, &arr, low, high)
		return arr
	}

	func inorder(_ node : Node?, _ arr : inout [Int], _ low : Int, _ high : Int) {
		if node == nil {
			return
		}
		inorder(node?.left, &arr, low, high)
		if node!.data >= low && node!.data <= high {
			arr.append(node!.data)
		}
		inorder(node?.right, &arr, low,high)
	}

}

// var tree = BinarySearchTree()
// tree.root = Node(17)
// tree.root?.left = Node(4)
// tree.root?.right = Node(18)
// tree.root?.left?.left = Node(2)
// tree.root?.left?.right = Node(9)

var tree = BinarySearchTree()
tree.root = Node(16)
tree.root?.left = Node(7)
tree.root?.right = Node(20)
tree.root?.left?.left = Node(1)
tree.root?.left?.right = Node(10)

let s = Solution()
let res = s.printNearNodes(tree.root, 13, 23)
print(res)
