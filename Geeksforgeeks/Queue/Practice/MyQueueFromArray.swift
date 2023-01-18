//Implement a Queue using an Array.

/* Non-Generic
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

	var isFull : Bool {
		return size == capacity
	}

	var isEmpty : Bool {
		return size == 0
	}

	var top : Int? {
		return isEmpty ? nil : array[front]
	}

	var end : Int? {
		return isEmpty ? nil : array[rear]
	}

	mutating func enqueue(_ element : Int) {
		guard !isFull else {
			return
		}
		rear = (rear + 1) % capacity
		array[rear] = element
		size += 1
		print("\(element) enqueued to queue")
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
		var str = ""
		while (i % capacity != (rear + 1)) {
			str += "\(array[i])" + "\n"
			i = i + 1 
		}
		return str
	}

}
*/

//Generic

struct Queue<T> {

	let capacity : Int
	var array : [T?]
	var front : Int
	var rear : Int
	var size : Int

	init(capacity : Int) {
		self.capacity = capacity
		self.array = Array<T?>(repeating : nil, count : capacity)
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

	var first : T? {
		return isEmpty ? nil : array[front]
	}

	var last : T? {
		return isEmpty ? nil : array[rear]
	}

	mutating func enqueue(_ element : T) {
		guard !isFull else {
			return
		}
		rear = (rear + 1) % capacity
		array[rear] = element
		size += 1
		print("\(element) enqueued to queue")	
	}

	@discardableResult
	mutating func dequeue() -> T? {
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
		while(i % capacity != (rear + 1) % capacity) {
			str += "\(array[i])" + "\n"
			i += 1
		}
		return str
	}

}


// var queue = Queue<Int>(capacity : 1000)
// queue.enqueue(10)
// queue.enqueue(20)
// queue.enqueue(30)
// queue.enqueue(40)
// print(queue)
// queue.dequeue()
// print(queue.first)
// print(queue.last)

var queue = Queue<String>(capacity : 4)
queue.enqueue("first")
queue.enqueue("second")
queue.enqueue("third")
queue.enqueue("fourth")
print(queue)
//queue.dequeue()
//print(queue.first)
//print(queue.last)













