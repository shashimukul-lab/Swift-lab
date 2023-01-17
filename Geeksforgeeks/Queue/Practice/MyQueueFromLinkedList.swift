//Implement a Queue using Linked List.

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

struct Queue {
	var front : Node?
	var rear : Node?

	var isEmpty : Bool {
		return rear == nil
	}

	mutating func enqueue(_ data : Int) {
		let n = Node(data : data)
		guard !isEmpty else {
			front = n
			rear = n
			return
		}
		rear?.next = n
		rear = n
	}

	@discardableResult
	mutating func dequeue() -> Int? {
		guard !isEmpty else {
			return nil
		}
		let data = front?.data
		front = front?.next
		if front == nil {
			rear = nil
		}
		return data
	}
}

extension Queue : CustomStringConvertible {

	var description : String {
		guard !isEmpty else {
			return "Queue is empty"
		}
		return front!.description
	}

}

var q = Queue()
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
print(q)
q.dequeue()
print(q)