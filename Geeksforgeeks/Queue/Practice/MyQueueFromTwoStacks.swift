// Implement a Queue using 2 stacks s1 and s2 .


struct Stack {
	var array = [Int]()

	var isEmpty : Bool {
		return array.isEmpty
	}

	mutating func push(_ data : Int) {
		array.append(data)
	}

	@discardableResult
	mutating func pop() -> Int? {
		guard !isEmpty else {
			return nil
		}
		return array.removeLast()
	}
}

struct Queue {
	var s1 = Stack()
	var s2 = Stack()

	var isEmpty : Bool {
		return s1.isEmpty && s2.isEmpty
	}

	mutating func enqueue(_ data : Int) {
		// while !s2.isEmpty {
		// 	if let e = s2.pop() {
		// 		s1.push(e)
		// 	}
		// }
		s1.push(data)
	}

	@discardableResult
	mutating func dequeue() -> Int? {
		guard !isEmpty else {
			print("Queue is empty")
			return nil
		}
		if s2.isEmpty {
			while !s1.isEmpty {
				if let e = s1.pop() {
					s2.push(e)
				}
			}
		}
		return s2.pop()
	}

	// mutating func printQueue() {
	// 	guard !isEmpty else {
	// 		print("Queue is empty")
	// 		return
	// 	}
	// 	while !s1.isEmpty {
	// 		if let e = s1.pop() {
	// 			s2.push(e)
	// 		}
	// 	}
	// 	while !s2.isEmpty {
	// 		if let e = s2.pop() {
	// 			print(e)
	// 			s1.push(e)
	// 		}
	// 	}
	// }
}

// var q = Queue()
// q.enqueue(2)
// q.enqueue(3)
// q.printQueue()
// q.dequeue()
// q.printQueue()
// q.enqueue(4)
// q.printQueue()

var q = Queue()
q.enqueue(2)
q.enqueue(3)
q.enqueue(4)
//q.printQueue()
print(q.dequeue()!)
//q.printQueue()
q.enqueue(5)
q.enqueue(6)
//q.printQueue()
print(q.dequeue()!)
//q.dequeue()
//q.enqueue(4)
//q.printQueue()