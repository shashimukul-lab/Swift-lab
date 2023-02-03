// Given a Singly Linked List of size N, delete all alternate nodes of the list.

class Node {
	var data : Int
	var next : Node?

	init(_ data : Int) {
		self.data = data
	}
}

struct LinkedList {
	var head : Node?

	var isEmpty : {
		return head == nil
	}

	mutating func push(_ data : Int) {
		let node = Node(data)
		node.next = head
		head = node
	}

	mutating func deleteAlt() {
		guard !isEmpty else {
			return
		}
		var curr = head
		var count = 1
		while let n = curr?.next, 
	}
}

