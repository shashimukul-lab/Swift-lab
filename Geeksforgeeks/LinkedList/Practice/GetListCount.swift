//Given a singly linked list. The task is to find the length of the linked list, where length is defined as the number of nodes in the linked list.

//var arr = [1, 2, 3, 4, 5]
var arr = [2, 4, 6, 7, 5, 1, 0]
arr.reverse()
class Node {
	var data : Int
	var next : Node?

	init(data : Int) {
		self.data = data
		self.next = nil
	}
}

struct Linkedlist {
	var head : Node?

	mutating func push(data : Int) {
		let node = Node(data : data)
		node.next = head
		head = node
	}

	mutating func createList(_ arr : [Int]) {
		// for i in (1...5).reversed() {
		// 	push(data : i)
		// }

		for e in arr {
			push(data : e)
		}
	}

	func getCount() -> Int {
		guard head != nil else {
			return 0
		}
		var curr = head
		var count = 0
		while curr != nil {
			count += 1
			curr = curr!.next
		}
		return count
	}

	func printList() {
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

var ll = Linkedlist()
ll.createList(arr)
ll.printList()
let c = ll.getCount()
print(c)