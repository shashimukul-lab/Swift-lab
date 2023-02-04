// Given a Queue Q containing N elements. The task is to reverse the Queue. 
//Your task is to complete the function rev(), that reverses the N elements of the queue.

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
	var tail : Node?

	var isEmpty : Bool {
		return tail == nil
	}

	mutating func append(_ data : Int) {
		let node = Node(data)
		if isEmpty {
			head = node
			tail = node
			return
		}
		tail?.next = node
		tail = node
	}

	@discardableResult
	mutating func removeFirst() -> Int? {
		guard !isEmpty else {
			 return nil
		}
		let tmp = head
		head = tmp?.next
		if head == nil {
			tail = nil
		}
		return tmp?.data
	}
}

struct Queue {
	var container = LinkedList()

	var isEmpty : Bool {
		return container.isEmpty
	}

	mutating func enqueue(_ data : Int) {
		container.append(data)
	}

	@discardableResult
	mutating func dequeue() -> Int? {
		return container.removeFirst()
	}

	func printQueue() {
		guard !isEmpty else {
			print("Queue is empty")
			return
		}
		var curr = container.head
		while let c = curr {
			print(c.data, terminator : " ")
			curr = c.next
		}
		print()
	}
}

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
		return array.removeLast()
	}
}

func rev(_ queue : Queue?) -> Queue? {
	guard var queue = queue else {
		return nil
	}
	var st = Stack()
	var resQueue = Queue()
	while !queue.isEmpty {
		if let e = queue.dequeue() {
			st.push(e)
		}
	}
	while !st.isEmpty {
		if let e = st.pop() {
			resQueue.enqueue(e)
		}
	}
	return resQueue
}

// var q = Queue()
// q.enqueue(4)
// q.enqueue(3)
// q.enqueue(1)
// q.enqueue(10)
// q.enqueue(2)
// q.enqueue(6)
// q.printQueue()
// if let res = rev(q) {
// 	res.printQueue()
// }

var q = Queue()
q.enqueue(4)
q.enqueue(3)
q.enqueue(2)
q.enqueue(1)
q.printQueue()
if let res = rev(q) {
	res.printQueue()
}