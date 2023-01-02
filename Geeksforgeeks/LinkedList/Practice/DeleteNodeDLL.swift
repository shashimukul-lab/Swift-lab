// Given a doubly linked list and a position. The task is to delete a node from given position in a doubly linked list.

//var arr = [1, 3, 4]
var arr = [1, 5, 2, 9]
arr.reverse()
let x = 3

class Node {
	var data : Int
	var prev : Node?
	var next : Node?

	init(data : Int) {
		self.data = data
		self.prev = nil
		self.next = nil 		
	} 	
}

struct DoublyLinkedList {
	var head : Node?

	mutating func push(data : Int) {
		let node = Node(data : data)
		node.next = head
		if head != nil {
			head!.prev = node
		}
		head = node
	}

	mutating func createList(_ arr : [Int]) {
		for e in arr {
			self.push(data : e)
		}
	}

	mutating func deleteNode(_ x : Int) -> Node? {
		guard head != nil else {
			return nil
		}

		var i = 1
		var curr = head
		while (curr != nil && i < x) {
			curr = curr!.next
			i += 1
		}
		/*First
		if curr != nil {
			if curr === head {
				head = curr!.next
				curr!.next?.prev = nil
				curr!.next = nil
			} else {
				curr!.prev?.next = curr!.next
				curr!.next?.prev = curr!.prev
				curr!.next = nil
				curr!.prev = nil
			}	
		} else {
			return nil
		}
		*/
		//Second
		guard curr != nil else {
			print("Node cannot be deleted")
			return head
		}
		if curr === head {
			head = curr!.next
		}
		if curr!.next != nil {
			curr!.next?.prev = curr!.prev
		}
		if curr!.prev != nil {
			curr!.prev?.next = curr!.next 
		}
		return head
	} 

	func printList() {
		guard head != nil else {
			print("List is empty")
			return
		}

		var curr = head
		while(curr != nil) {
			print("\(curr!.data)", terminator : " ")
			curr = curr!.next
		}
		print()
	} 	
}

var dll = DoublyLinkedList()
dll.createList(arr)
dll.printList() 
dll.head = dll.deleteNode(x)
print("After delete")
dll.printList()