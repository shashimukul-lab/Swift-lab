//Given an array arr[] of size N,enqueue the elements of the array into a queue and then dequeue them.

//let arr = [1, 2, 3, 4, 5]
let arr = [1, 6, 43, 1, 2, 0, 5]

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
		return String(describing : next)
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
		let e = front?.data
		front = front?.next
		if front == nil {
			rear = nil
		}
		return e
	}
}

func push(_ arr : [Int]) -> Queue? {
	guard !arr.isEmpty else {
		return nil
	}
	var q = Queue()
	for e in arr {
		q.enqueue(e)
	}
	return q
}

func pop(_ queue : Queue?) {
	guard let queue = queue else {
		print("Queue is empty")
		return
	}
	var q = queue
	while !q.isEmpty {
		print(q.dequeue())
	}
}

var q = push(arr)
pop(q)