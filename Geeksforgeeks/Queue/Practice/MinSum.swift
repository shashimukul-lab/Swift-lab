// Given an array of digits (values are from 0 to 9), find the minimum possible sum of two numbers formed from digits of the array. 
//All digits of the given array must be used to form the two numbers.

//Any combination of digits may be used to form the two numbers to be summed.  Leading zeroes are permitted.

//If forming two numbers is impossible (i.e. when n==0) then the "sum" is the value of the only number that can be formed.

let arr = [6, 8, 4, 5, 2, 3]
//let arr = [5, 3, 0, 7, 4]

struct Heap {
	var array : [Int]
	var sort : (Int, Int) -> Bool

	init(sort : @escaping (Int, Int) -> Bool, _ array : [Int]) {
		self.array = array
		self.sort = sort
		for i in stride(from : array.count / 2 - 1, through : 0, by : -1) {
			shiftDown(i)
		}
	}

	var isEmpty : Bool {
		return array.isEmpty
	}

	var count : Int {
		return array.count
	}

	func leftChild(_ index : Int) -> Int {
		return 2 * index + 1
	}

	func rightChild(_ index : Int) -> Int {
		return 2 * index + 2
	}

	func parent(_ index : Int) -> Int {
		return (index - 1) / 2
	}

	mutating func insert(_ data : Int) {
		array.append(data)
		shiftUp(count - 1)
	}

	mutating func shiftUp(_ index : Int) {
		var child = index
		var p = parent(child)
		while child > 0 && sort(array[child], array[p]) {
			array.swapAt(child, p)
			child = p
			p = parent(child)
		}
	}

	@discardableResult
	mutating func remove() -> Int? {
		guard !array.isEmpty else {
			return nil
		}
		array.swapAt(0, count - 1)
		defer {
			shiftDown(0)	
		}
		return array.removeLast()
	}

	mutating func shiftDown(_ index : Int) {
		var parent = index
		while parent < count {
			let left = leftChild(parent)
			let right = rightChild(parent)
			var candidate = parent
			if left < count && sort(array[left], array[candidate]) {
				candidate = left
			}
			if right < count && sort(array[right], array[candidate]) {
				candidate = right
			}
			if candidate == parent {
				return
			}
			array.swapAt(parent, candidate)
			parent = candidate
		}
	}
}

// func minSum(_ arr : [Int]) -> Double {
// 	guard !arr.isEmpty else {
// 		return 0.0
// 	}
// 	guard arr.count != 1 else {
// 		return Double(arr[0])
// 	}

// 	let sortedArr = arr.sorted()
// 	var num1 : Double = 0.0
// 	var num2 : Double = 0.0
// 	var i = 0
// 	while i < sortedArr.count {
// 		num1 = num1 * 10.0 + Double(sortedArr[i])
// 		i = i + 1
// 		if i < arr.count {
// 			num2 = num2 * 10.0 + Double(sortedArr[i])
// 			i = i + 1
// 		}
// 	}
// 	return num1 + num2
// }

func minSum(_ arr : [Int]) -> Double {
	guard !arr.isEmpty else {
		return 0.0
	}
	guard arr.count != 1 else {
		return Double(arr[0])
	}

	var h = Heap(sort : <, arr)
	var num1 = 0.0
	var num2 = 0.0
	while !h.isEmpty {
		if let e = h.remove() {
			num1 = num1 * 10.0 + Double(e)
		}
		if let e = h.remove() {
			num2 = num2 * 10.0 + Double(e)
		} 
	}
	return num1 + num2
}


let res = minSum(arr)
print(res)