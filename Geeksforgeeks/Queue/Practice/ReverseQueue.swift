//Given a Queue Q containing N elements. The task is to reverse the Queue.

struct Queue {
	let capacity : Int
	var array : [Int]
	var front : Int
	var rear : Int
	var size : Int

	init(capacity : Int) {
		self.capacity = capacity
		self.array = Array(repeating : 0, count : capacity)
		self.front = 0
		self.rear = capacity - 1
		self.size = 0
	}

	var isEmpty : Bool {
		return size == 0
	}

	var isFull : Bool {
		return size == capacity
	}

	mutating func enqueue(_ element : Int) {
		guard !isFull else {
			return
		}
		rear = (rear + 1) % capacity
		array[rear] = element
		size += 1
	}

	@discardableResult
	mutating func dequeue() -> Int? {
		guard !isEmpty else {
			return nil
		}
		let e = array[front]
		front = (front + 1) % capacity
        size -= 1
        return e
	}
}

extension Queue : CustomStringConvertible {
	
	var description : String {
		guard !isEmpty else {
			return "Queue is empty"
		}
		var i = front
		var str = "\(array[i])\n"
		i += 1
		//print(rear, front)
		while (i % capacity != (rear + 1) % capacity) {
			str += "\(array[i])" + "\n"
			i += 1
		}
		//print(str)
		return str
	}

}

func rev(_ queue : Queue) -> Queue? {
	guard !queue.isEmpty else {
		return nil
	}
	var q = queue
	var result = Queue(capacity : queue.capacity)
	var tmp = [Int]()
	while !q.isEmpty {
		if let e = q.dequeue() {
			tmp.append(e)
		}
	}
	tmp.reverse()
	for e in tmp {
		result.enqueue(e)
	}
	return result
}

var q = Queue(capacity : 4)
q.enqueue(4)
q.enqueue(3)
q.enqueue(2)
q.enqueue(1)
//print(q)
let r = rev(q)
print(r!)