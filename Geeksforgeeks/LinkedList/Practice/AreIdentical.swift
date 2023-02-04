// Given two Singly Linked List of N and M nodes respectively. The task is to check whether two linked lists are identical or not. 
//Two Linked Lists are identical when they have same data and with same arrangement too.

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

}

// func areIdentical(_ ll1 : LinkedList, _ ll2 : LinkedList) -> Bool {
// 	if ll1.isEmpty && ll2.isEmpty {
// 		return true
// 	}
// 	var curr1 = ll1.head
// 	var curr2 = ll2.head
// 	while curr1 != nil && curr2 != nil && curr1!.data == curr2!.data {
// 		curr1 = curr1?.next
// 		curr2 = curr2?.next
// 	}
// 	if curr1 == nil && curr2 == nil {
// 		return true
// 	}
// 	return false
// }

func areIdentical(_ ll1 : Node?, _ ll2 : Node?) -> Bool {
	if ll1 == nil && ll2 == nil {
		return true
	}
	if ll1 != nil && ll2 != nil {
		return (ll1!.data == ll2!.data) && areIdentical(ll1!.next, ll2!.next)
	}
	return false
}

var ll1 = LinkedList()
ll1.push(6)
ll1.push(5)
ll1.push(4)
ll1.push(3)
ll1.push(2)
ll1.push(1)
var ll2 = LinkedList()
ll2.push(20)
ll2.push(42)
ll2.push(59)
ll2.push(99)
let r = areIdentical(ll1.head, ll2.head)
print(r)

// var ll1 = LinkedList()
// ll1.push(5)
// ll1.push(4)
// ll1.push(3)
// ll1.push(2)
// ll1.push(1)
// var ll2 = LinkedList()
// ll2.push(5)
// ll2.push(4)
// ll2.push(3)
// ll2.push(2)
// ll2.push(1)
// let r = areIdentical(ll1.head, ll2.head)
// print(r)