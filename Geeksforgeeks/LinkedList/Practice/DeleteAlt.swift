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

	var isEmpty : Bool {
		return head == nil
	}

	mutating func push(_ data : Int) {
		let node = Node(data)
		node.next = head
		head = node
	}

	//Method 1
	// mutating func deleteAlt() {
	// 	guard !isEmpty else {
	// 		return
	// 	}
	// 	var curr = head
	// 	while let n = curr?.next {
	// 		curr?.next = n.next
	// 		curr = curr?.next
	// 	} 
	// }

	//Method 2
	func deleteAlt(_ node : Node?) -> Node? {
		guard node != nil else {
			return nil
		}
		let tmp = node?.next
		if tmp == nil {
			return node
		} 
		node?.next = deleteAlt(tmp?.next)
		return node
	}

	func printList() {
		guard !isEmpty else {
			print("List is empty")
			return
		}
		var curr = head
		while let n = curr {
			print(n.data, terminator : " ")
			curr = n.next
		}
		print()
	}
}

// var ll = LinkedList()
// ll.push(6)
// ll.push(5)
// ll.push(4)
// ll.push(3)
// ll.push(2)
// ll.push(1)
// ll.printList()
// ll.deleteAlt()
// ll.printList()

var ll = LinkedList()
ll.push(20)
ll.push(42)
ll.push(59)
ll.push(99)
ll.printList()
ll.deleteAlt(ll.head)
ll.printList()