/*
Given the head of a singly linked list, reverse the list, and return the reversed list.
*/

class Node {
	var data : Int
	var next : Node?

	init(data : Int) {
		self.data = data
		self.next = nil
	}
}

extension Node : CustomStringConvertible {

	var description : String {
		guard let next = next else {
			return "\(data)"
		}
		return "\(data)" + " -> " + String(describing : next)
	}
}

//Iterative function
func reverseList(_ head : Node?) -> Node? {

	guard head != nil else {
		return nil
	}
	var curr = head
	var prev : Node? = nil
	while (curr != nil) {
		let tmp = curr?.next
		curr?.next = prev
		prev = curr
		//if tmp != nil {
			curr = tmp
		//}
	}
	return prev
}

//Recursive function
// func reverseList(_ head : Node?) -> Node? {
// 	if head == nil || head?.next == nil {
// 		return head
// 	}
// 	let res = reverseList(head?.next)
// 	head?.next?.next = head
// 	head?.next = nil
// 	return res  
// }

let n1 = Node(data : 1)
let n2 = Node(data : 2)
let n3 = Node(data : 3)
let n4 = Node(data : 4)
n1.next = n2
n2.next = n3
n3.next = n4
//print(n1)
if let rNode = reverseList(n1) {
	print(rNode)
	//print(rNode.next?.data ?? -1)
} 