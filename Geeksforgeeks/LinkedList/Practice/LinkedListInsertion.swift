// Create a link list of size N according to the given input literals. Each integer input is accompanied by an indicator which can either be 0 or 1. 
//If it is 0, insert the integer in the beginning of the link list. If it is 1, insert the integer at the end of the link list. 

//let str = "9->0->5->1->6->1->2->0->5->0"
let str = "5->1->6->1->9->1"

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

	mutating func insertAtBegining(_ data : Int) {
		let node = Node(data)
		node.next = head
		head = node
	}

	mutating func insertAtEnd(_ data : Int) {
		guard !isEmpty else {
			head = Node(data)
			return
		}
		var curr = head
		while let c = curr?.next {
			curr = c
		}
		curr?.next = Node(data)
	}

	func printList() {
		guard !isEmpty else{
			return
		}
		var curr = head
		while let c = curr {
			print(c.data, terminator : " ")
			curr = c.next
		}
		print()
	}
}

var arr = [Int]()
for c in str {
	if c == "-" || c == ">" {
		continue
	}
	arr.append((c.wholeNumberValue)!)
}
//print(arr)

var ll = LinkedList()
for i in stride(from : 0, through : arr.count - 1, by : 2) {
	let n = arr[i]
	let o = arr[i + 1]
	if o == 0 {
		ll.insertAtBegining(n)
	}
	if o == 1 {
		ll.insertAtEnd(n)
	}
}
ll.printList()