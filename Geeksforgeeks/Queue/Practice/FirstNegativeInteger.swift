// Given an array A[] of size N and a positive integer K, find the first negative integer for each and every window(contiguous subarray) of size K.

//let arr : [Double] = [-8, 2, 3, -6, 10]
let arr : [Double] = [12, -1, -7, 8, -15, 30, 16, 28]
let k = 3

class Node {
	var data : Double
	var next : Node?

	init(_ data : Double) {
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

	var top : Double? {
		return isEmpty ? nil : front?.data
	}

	mutating func enqueue(_ data : Double) {
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
	mutating func dequeue() -> Double? {
		guard !isEmpty else {
			return nil
		}
		let d = front?.data
		front = front?.next
		if front == nil {
			rear = nil
		}
		return d
	}

	func printQueue() {
		guard !isEmpty else {
			print("Queue is Empty")
			return
		}
		var curr = front
		while(curr != nil) {
			print(curr!.data, terminator : " ")
			curr = curr?.next
		}
		print()
	}
}

//Method 1
// func printFirstNegativeInteger(_ arr : [Double], _ k : Int) -> [Double] {
// 	guard !arr.isEmpty else {
// 		return []
// 	}
// 	if k > arr.count {
// 		return []
// 	}
// 	var res = [Double]()
// 	for i in 0...arr.count - k {
// 		var found = 0
// 		for j in i..<i+k {
// 			if arr[j] < 0 {
// 				res.append(arr[j])
// 				found = 1
// 				break
// 			}
// 		}
// 		if found == 0 {
// 			res.append(0)
// 		}
// 	}
// 	return res
// }


//Method 2
func printFirstNegativeInteger(_ arr : [Double], _ k : Int) -> [Double] {
	guard !arr.isEmpty else {
		return []
	}
	if k > arr.count {
		return []
	}
	var res = [Double]()
	var q = Queue()
	for i in 0...arr.count - k {
		if !q.isEmpty {
			if let t = q.top {
				res.append(t)
				if t == arr[i] {
					q.dequeue()
				}
			}
		} else {
			for j in 0..<k {
				if arr[i + j] < 0 {
					q.enqueue(arr[i + j])
					break
				}
			}
			if q.isEmpty {
				res.append(0.0)
			} else {
				if let t = q.top {
					res.append(t)
					if t == arr[i] {
						q.dequeue()
					}
				}
			}
		}
		
	}
	return res
}

let res = printFirstNegativeInteger(arr, k)
print(res)