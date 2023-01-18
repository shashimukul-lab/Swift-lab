//Implement different operations on a queue.

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
			return "\(data) "
		}
		return "\(data) " + String(describing : next)
	}
}

struct Queue {
	var front : Node?
	var rear : Node?

	var isEmpty : Bool {
		return rear == nil
	}

	var size : Int {
		guard !isEmpty else {
			return 0
		}
		var count = 0
		var curr = front
		while curr != nil {
			count += 1
			curr = curr?.next
		}
		return count
	}

	var getFront : Int? {
		guard !isEmpty else {
			return nil
		}
		return front?.data
	}

	var getBack : Int? {
		guard !isEmpty else {
			return nil
		}
		return rear?.data
	}

	mutating func push(_ data : Int) {
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
	mutating func pop() -> Int? {
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

extension Queue : CustomStringConvertible {
	
	var description : String {
		guard !isEmpty else {
			return "Queue is empty"
		}
		return front!.description
	}
}

var q = Queue()
q.push(1)
q.push(2)
q.push(3)
q.push(4)
print(q)
print(q.size)
print(q.getFront!)
print(q.getBack!)
q.pop()
print(q)