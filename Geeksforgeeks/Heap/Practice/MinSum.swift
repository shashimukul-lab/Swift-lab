// Given an array of digits (values are from 0 to 9), find the minimum possible sum of two numbers formed from digits of the array. 
//All digits of the given array must be used to form the two numbers.

//Any combination of digits may be used to form the two numbers to be summed.  Leading zeroes are permitted.

//If forming two numbers is impossible (i.e. when n==0) then the "sum" is the value of the only number that can be formed.

//let arr = [6, 8, 4, 5, 2, 3]
let arr = [5, 3, 0, 7, 4]

struct Heap {
	var elements = [Int]()
	var sort : (Int, Int) -> Bool 

	init(sort : @escaping (Int, Int) -> Bool, elements : [Int] = []) {
		self.sort = sort
		self.elements = elements
		if !elements.isEmpty {
			for i in stride(from : count / 2 - 1, through : 0, by : -1) {
				shiftDown(i)
			}
		}
	}

	var isEmpty : Bool {
		return elements.isEmpty
	}

	var count : Int {
		return elements.count
	}

	func leftChild(_ index : Int) -> Int {
		return (2 * index) + 1
	}

	func rightChild(_ index : Int) -> Int {
		return 2 * index + 2
	}

	func parent(_ index : Int) -> Int {
		return (index - 1) / 2
	}

	mutating func insert(_ element : Int) {
		elements.append(element)
		shiftUp(count - 1)
	}

	mutating func shiftUp(_ index : Int) {
		var child = index
		var p = parent(index)
		while child > 0 && sort(elements[child], elements[p]) {
			elements.swapAt(child, p)
			child = p
			p = parent(child)
		}
	}

	@discardableResult
	mutating func remove() -> Int? {
		guard !isEmpty else {
			return nil
		}
		elements.swapAt(0, count - 1)
		defer {
			shiftDown(0)
		}
		return elements.removeLast()
	}

	mutating func shiftDown(_ index : Int) {
		var parent = index
		while true {
			let l = leftChild(parent)
			let r = rightChild(parent)
			var candidate = parent
			if l < count && sort(elements[l], elements[candidate]) {
				candidate = l
			}
			if r < count && sort(elements[r], elements[candidate]) {
				candidate = r
			}
			if candidate == parent {
				return
			}
			elements.swapAt(candidate, parent)
			parent = candidate
		}
	}

}

func minSum(_ arr : [Int]) -> Double {
	guard !arr.isEmpty else {
		return 0.0
	}
	if arr.count == 1 {
		return Double(arr[0])
	}
	var num1 = 0.0
	var num2 = 0.0
	var h = Heap(sort : <, elements : arr)
	while !h.isEmpty {
		if let s1 = h.remove() {
			num1 = num1 * 10.0 + Double(s1)
		}
		if let s2 = h.remove() {
			num2 = num2 * 10.0 + Double(s2)
		}
	}
	return num1 + num2
}

let s = minSum(arr)
print(s)


