// A simple program to introduce a linked list

class Node {
	var data : Int
	var next : Node?

	init(data : Int, next : Node) {
		self.data = data
		self.next = next
	}

	init(data : Int) {
		self.data = data
		self.next = nil
	}

	convenience init() {
		self.init(data : 0)
	}
}

extension Node : CustomStringConvertible {
	
	var description : String {
		guard let next = next else {
			return "\(data)"
		}
		return "\(data) -> " + String(describing : next) + " "
	}

}

let head = Node(data : 1)
let node1 = Node(data : 2)
let node2 = Node(data : 3)
head.next = node1
node1.next = node2
print(head.description)

class LinkedList {
	var head : Node?

	func printList() {
		guard let head = head else {
			print("List is empty")
			return
		}
		var curr : Node? = head
		while(curr != nil) {
			print(curr!.data, terminator : "-->")
			curr = curr!.next
		}
		print("")
	}
}

let ll = LinkedList()
ll.head = head
ll.printList()



