//Given a binary tree, find its preorder traversal.


class Node {
	var data : Int
	var left : Node?
	var right : Node?

	init(data : Int) {
		self.data = data
		self.left = nil
		self.right = nil
	}
}

struct BinaryTree {
	var root : Node?

	func printTree(_ node : Node?) {
		guard let n = node else {
			return
		}
		printTree(n.left)
		print("\(n.data)", terminator : " ")
		printTree(n.right)
	}

	func preorder() {
		guard let r = root else {
			return
		}
		var st = Stack()
		st.push(r)
		while !st.isEmpty {
			let n = st.pop()
			print("\(n!.data)", terminator : " ")
			if n!.right != nil {
				st.push(n!.right!)
			}
			if n!.left != nil {
				st.push(n!.left!)
			}
		}
	}
}



var t = BinaryTree()
// t.root = Node(data : 1)
// t.root?.left = Node(data : 4)
// t.root?.left?.left = Node(data : 4)
// t.root?.left?.right = Node(data : 2)

t.root = Node(data : 6)
t.root?.left = Node(data : 3)
t.root?.right = Node(data : 2)
t.root?.left?.right = Node(data : 1)
t.root?.right?.left = Node(data : 2)

//t.printTree(t.root)
t.preorder()

struct Stack {
	var arr = [Node]()

	var isEmpty : Bool {
		return arr.isEmpty
	}

	mutating func push(_ x : Node) {
		arr.append(x)
	}

	@discardableResult
	mutating func pop() -> Node? {
		return arr.popLast()
	}

	// static func createList() -> Stack {
	// 	var st = Stack()
	// 	for i in 1...5 {
	// 		st.push(i)
	// 	}
	// 	return st
	// }
}

extension Stack : CustomStringConvertible {
	
	var description : String {
		let e = arr.reversed().map { "\($0.data)" }.joined(separator : "\n")
		return e
	}
	
}

//var st = Stack.createList()
//print(st)

