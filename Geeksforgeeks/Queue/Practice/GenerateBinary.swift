// Given a number N. The task is to generate and print all binary numbers with decimal values from 1 to N.

import Foundation
//let n = 4
//let n = 5
let n = 10

class Node {
	var data : String
	var next : Node?

	init(_ data : String) {
		self.data = data
		self.next = nil
	}
}

struct Queue {
	var head : Node?
	var tail : Node?

	var isEmpty : Bool {
		return tail == nil
	}

	mutating func enqueue(_ data : String) {
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
	mutating func dequeue() -> String? {
		guard !isEmpty else {
			return nil
		}
		let e = head?.data
		head = head?.next
		if head == nil {
			tail = nil
		}
		return e
	}

	// var capacity : Int
	// var array : [Int]

	// var front : Int
	// var rear : Int

	// var isEmpty : Bool {
	// 	return rear == -1
	// }

	// var isFull : Bool {
	// 	return rear == capacity
	// }

	// var top : Int? {
	// 	return isEmpty ? nil : array[front]
	// }

	// init(_ capacity : Int) {
	// 	self.capacity = capacity
	// 	self.array = Array(repeating : 0, count : capacity)
	// 	self.front = -1
	// 	self.rear = -1
	// }

	// mutating func enqueue(_ data : Int) {
	// 	if isFull {
	// 		print("Queue is full")
	// 		return
	// 	}
	// 	rear += 1
	// 	array[rear] = data
	// 	if rear == 0 {
	// 		front = rear
	// 	}
	// }

	// @discardableResult
	// mutating func dequeue() -> Int? {
	// 	if isEmpty {
	// 		return nil
	// 	}
	// 	let e = array[front]
	// 	front += 1
	// 	if front > rear {
	// 		front = -1
	// 		rear = -1
	// 	}
	// 	return e
	// }

	// func printQueue() {
	// 	if isEmpty {
	// 		print("Queue is empty")
	// 		return
	// 	}
	// 	for i in front...rear {
	// 		print(array[i], terminator : " ")
	// 	}
	// 	print()
	// }
}

// func generate(_ n : Int) -> [String] {
// 	if n <= 0 {
// 		return []
// 	}
// 	let capacity = Int(floor(log2(Double(n))) + 1.0)
// 	var q = Queue(capacity)
// 	var res = [String]()
// 	q.enqueue(1)
// 	res.append("1")
// 	while let last = res.last, let num = Int(last, radix : 2), num < n {
// 		var flag = 1
// 		var tmpQueue = Queue(capacity)
// 		var str = ""
// 		for i in (q.front...q.rear).reversed() {
// 			flag = flag & q.array[i]
// 			if flag == 0 {
// 				q.array[i] = 1
// 				break
// 			}
// 		}
// 		if flag == 1 {
// 			while !q.isEmpty {
// 				if let e = q.dequeue() {
// 					tmpQueue.enqueue(e)
// 				}
// 			}
// 			q.enqueue(1)
// 			while !tmpQueue.isEmpty {
// 				if let _ = tmpQueue.dequeue() {
// 					q.enqueue(0)
// 				}
// 			}
// 		}
// 		for i in q.front...q.rear {
// 			str += String(q.array[i])
// 		}
// 		res.append(str)
// 	}
// 	return res
// }

func generate(_ n : Int) -> [String] {
	if n <= 0 {
		return []
	}
	var res = [String]()
	var q = Queue()
	q.enqueue("1")
	var num = n
	while num > 0 {
		if let e = q.dequeue() {
			res.append(e)
			let left = e + "0"
			let right = e + "1"
			q.enqueue(left)
			q.enqueue(right)
		}
		num = num - 1
	}
	return res
}

let res = generate(n)
print(res)