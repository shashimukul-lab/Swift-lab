// A simple program to introduce a linked list

// //Non - Generic
// class Node {
// 	var data : Int
// 	var next : Node?

// 	init(data : Int, next : Node) {
// 		self.data = data
// 		self.next = next
// 	}

// 	init(data : Int) {
// 		self.data = data
// 		self.next = nil
// 	}

// 	convenience init() {
// 		self.init(data : 0)
// 	}
// }

// extension Node : CustomStringConvertible {
	
// 	var description : String {
// 		guard let next = next else {
// 			return "\(data)"
// 		}
// 		return "\(data) -> " + String(describing : next) + " "
// 	}

// }

// let head = Node(data : 1)
// let node1 = Node(data : 2)
// let node2 = Node(data : 3)
// head.next = node1
// node1.next = node2
// print(head.description)

// class LinkedList {
// 	var head : Node?

// 	init() { }

// 	func printList() {
// 		guard let head = head else {
// 			print("List is empty")
// 			return
// 		}
// 		var curr : Node? = head
// 		while(curr != nil) {
// 			print(curr!.data, terminator : "-->")
// 			curr = curr!.next
// 		}
// 		print("")
// 	}
// }

// extension LinkedList : CustomStringConvertible {

// 	var description : String {
// 		guard let head = head else {
// 			return "Empty List"
// 		}
// 		return String(describing : head)
// 	}

// }

// let ll = LinkedList()
// ll.head = head
// ll.printList()
// print(ll.description)

//Generic
class Node<T : Equatable> {
	var data : T
	var next : Node<T>?

	init(data : T) {
		self.data = data
		self.next = nil
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

// let node1 = Node(data : 1)
// let node2 = Node(data : 2)
// let node3 = Node(data : 3)

// node1.next = node2
// node2.next = node3

// let head = node1
// print(head.description)

struct LinkedList<T : Equatable> {
	var head : Node<T>?

	mutating func push(_ data : T) {
		let node = Node(data : data)
		node.next = head
		head = node
	}

	mutating func insertAfter(_ prevNode : Node<T>?, _ data : T) {
		guard let prevNode = prevNode else {
			return
		}
		let node = Node(data : data)
		node.next = prevNode.next
		prevNode.next = node
	}

	mutating func append(_ data : T) {
		let node = Node(data : data)
		if head == nil {
			head = node
			return
		}
		var curr = head
		while(curr!.next != nil) {
			curr = curr!.next
		}
		curr!.next = node 
	}

	mutating func pop() {
		guard let tmp = head else {
			return
		}
		head = tmp.next
	}

	mutating func removeLast() {
		guard var tmp = head else {
			return
		}
		while(tmp.next != nil && tmp.next?.next != nil) {
			tmp = tmp.next!
		}
		tmp.next = nil

		// guard let head = head else {
		// 	return
		// }

		// guard head.next != nil else {
		// 	return
		// }

		// var prev = head
		// var curr = head
		// while let next = curr.next {
		// 	prev = curr
		// 	curr = next
		// }
		// prev.next = nil
	}

	mutating func deleteNode(_ data : T) {
		guard var _ = head else {
			return
		}

		var tmp = head, prev = head
		if tmp?.data == data {
			head = tmp?.next
			return
		}

		// while tmp?.next?.data != data {
		// 	tmp = tmp?.next
		// }
		// tmp?.next = tmp?.next?.next

		while let t = tmp, t.data != data {
			prev = t
			tmp = tmp?.next
		}
		if tmp == nil {
			return
		}
		prev?.next = tmp?.next 
	}

	mutating func deleteNodeRec(_ node : inout Node<T>?, _ data : T) {
		guard var tmp = node else {
			return
		}
		if tmp.data == data {
			//print(tmp?.next)
			if tmp.next != nil {
				tmp = tmp.next!
				node = tmp
			} else {
				node = nil
			}
			
			return
		}
		deleteNodeRec(&tmp.next, data)
	}  
}

extension LinkedList : CustomStringConvertible {

	var description : String {
		guard let head = head else {
			return "Empty List"
		}
		return String(describing : head)
	}

}

var ll = LinkedList<Int>()
print(ll.description)
ll.push(7)
ll.push(8)
ll.push(3)
//print(ll.description)
ll.push(2)
ll.push(1)
print(ll.description)
ll.insertAfter(ll.head!.next, 4)
print(ll.description)
ll.append(5)
print(ll.description)
ll.pop()
print(ll.description)
ll.removeLast()
print(ll.description)
//ll.deleteNode(4)
var head = ll.head
ll.deleteNodeRec(&head, 4)
print(ll.description)


