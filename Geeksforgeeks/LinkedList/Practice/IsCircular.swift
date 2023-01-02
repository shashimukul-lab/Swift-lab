//Given head, the head of a singly linked list, find if the linked list is circular or not. 
//A linked list is called circular if it not NULL terminated and all nodes are connected in the form of a cycle.
//An empty linked list is considered as circular.

//var arr = []
//arr.reverse()

class Node {
	var data : Int
	var next : Node?

	init(data : Int) {
		self.data = data
	}
}

extension Node : CustomStringConvertible {
	
	var description : String {
		guard let next = next else {
			return "\(data)"
		}
		return "\(data) -> " + String(describing : next)
	}

}


func isCircular(_ head : Node?) -> Bool {
	guard head != nil else {
		return true 
	}
	/*First
	var curr = head?.next
	while(curr != nil && curr !== head) {
		//print("data \(curr!.data)")
		curr = curr!.next
	}
	*/
	//Second
	var curr = head
	repeat {
		curr = curr!.next
	} while(curr != nil && curr !== head)

	return curr === head
}

let head = Node(data : 1)
head.next = Node(data : 2)
head.next?.next = Node(data : 3)
head.next?.next?.next = Node(data : 4)
head.next?.next?.next?.next = head
//print(head)

let v = isCircular(head)
print(v)
