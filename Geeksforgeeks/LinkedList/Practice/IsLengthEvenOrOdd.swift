// Given a linked list of size N, your task is to complete the function isLengthEvenOrOdd() which contains head of the linked list 
//and check whether the length of linked list is even or odd.

class Node {
	var data : Int
	var next : Node?

	init(_ data : Int) {
		self.data = data
		self.next = nil
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

	func isLengthEvenOrOdd() -> String {
		guard !isEmpty else {
			return "even"
		}
		var curr = head
		var count = 0
		while let c = curr {
			count += 1
			curr = c.next
		}
		if count % 2 == 0 {
			return "even"
		}
		return "odd"
	}
}

// var ll = LinkedList()
// ll.push(3)
// ll.push(4)
// ll.push(9)
// let r = ll.isLengthEvenOrOdd()
// print(r)


var ll = LinkedList()
ll.push(0)
ll.push(95)
ll.push(47)
ll.push(10)
ll.push(52)
ll.push(12)
let r = ll.isLengthEvenOrOdd()
print(r)
