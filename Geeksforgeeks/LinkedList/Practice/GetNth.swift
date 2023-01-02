//Given a singly linked list with N nodes and a number X. The task is to find the node at the given index (X)(1 based index) of linked list.

//var arr = [1, 2, 3, 4, 657, 76]
var arr = [8, 7, 10, 8, 6, 1, 20, 91, 21, 2]
//var arr = [4, 9]
arr.reverse()
let x = 2

class Node {
	var data : Int
	var next : Node?

	init(data : Int) {
		self.data = data
		self.next = nil
	}
}

struct LinkedList {

	var head : Node?

	mutating func push(data : Int) {
		let node = Node(data : data)
		node.next = head
		head = node
	}

	mutating func createList(_ arr : [Int]) {
		for e in arr {
			push(data : e)
		}
	}

	var isEmpty : Bool {
		return head == nil
	}

	func getNth(_ index : Int) -> Int? {
		guard !self.isEmpty else {
			print("List is empty")
			return nil
		}
		/* //First
		var curr = head
		var i = 1
		while curr != nil && i < index {
			i += 1
			curr = curr!.next
		}
		if curr != nil {
			//print(curr!.data)
			return curr!.data	
		} else {
			print("Index out of bound")
			return nil
		}
		return nil
		*/

		var curr = head
		var count = 1
		while (curr != nil) {
			if count == index {
				return curr!.data
			}
			count += 1
			curr = curr!.next
		}
		return nil
	}

	func printList() {
		guard head != nil else {
			return
		}
		var curr = head
		while curr != nil {
			print("\(curr!.data)", terminator : " ")
			curr = curr!.next
		}
		print()
	}

}


var ll = LinkedList()
ll.createList(arr)
ll.printList()
let v = ll.getNth(x)
print(v!)