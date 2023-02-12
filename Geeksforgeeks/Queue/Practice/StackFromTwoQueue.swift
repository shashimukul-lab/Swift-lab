// Implement a Stack using two queues q1 and q2.

class Node {
	var data : Int
	var next : Node?

	init(_ data : Int) {
		self.data = data
		self.next = nil
	}
}

struct Queue {
	var front : Node?
	var rear : Node?

	var isEmpty : Bool {
		return rear == nil
	}

	mutating func enqueue(_ data : Int) {
		let n = Node(data)
		if isEmpty {
			front = n
			rear = front
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
		let e = front?.data
		front = front?.next
		if front == nil {
			rear = nil
		}
		return e
	}
}

struct Stack {
	var q1 = Queue()
	var q2 = Queue()

	var isEmpty : Bool {
		return q1.isEmpty && q2.isEmpty
	}

	mutating func push(_ data : Int) {
		q1.enqueue(data)
	}

	@discardableResult
	mutating func dequeue() -> Int? {
		guard !isEmpty else {
			return nil
		}
		while !q1.isEmpty {
			if let e = q1.dequeue() {
				q2.enqueue(e)
			}
		}
		return q2.dequeue()
	}
}