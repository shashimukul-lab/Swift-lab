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

	var size = 0

	mutating func enqueue(_ data : Int) {
		let n = Node(data)
		size += 1
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
		size -= 1
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
	mutating func pop() -> Int? {
		guard !isEmpty else {
			return nil
		}
		while q1.size != 1 {
			if let e = q1.dequeue() {
				q2.enqueue(e)
			}
		}
		
		defer {
			let q = q1
			q1 = q2
			q2 = q
		}

		return q1.dequeue()
	}
}

// var st = Stack()
// st.push(2)
// st.push(3)
// print(st.pop()!)
// st.push(4)
// print(st.pop()!)


var st = Stack()
st.push(2)
print(st.pop()!)
print(st.pop())
st.push(3)
//print(st.pop()!)
