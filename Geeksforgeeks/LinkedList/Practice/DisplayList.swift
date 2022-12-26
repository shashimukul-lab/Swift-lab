//Given a linked list. Print all the elements of the linked list.


class Node {
	var data : Int
	var next : Node?

	init(data : Int) {
		self.data = data
		self.next = nil
	}
}


struct LinkedList {

	var head : Node? = nil

	mutating func push(_ data : Int) {
		let node = Node(data : data)
		node.next = head
		head = node
	}

	mutating func createList() {
		for i in (1...5).reversed() {
			push(i) 
		}
	}

	func display() {
		guard head != nil else {
			return
		}
		var curr = head
		while(curr != nil) {
			print("\(curr!.data)", terminator : " ")
			curr = curr!.next
		}
		print("")
	}

}

var ll = LinkedList()
ll.createList()
ll.display()



