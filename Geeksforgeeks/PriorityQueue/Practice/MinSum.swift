// You are given N numbers you can decrease each number by 10 % or K kg whichever is more. 
//If the number you choose is less than K you can make it zero. 
//Your task is to minimize the sum of the number as small as possible by performing N operations only

//Note: Final answer should be typecasted to the nearest integer smaller or equal to the value.

import Foundation
let arr = [90, 100]
let k = 10
let n = 2

struct Heap {
	var elements = [Int]()
	let sort : (Int, Int) -> Bool

	init(sort : @escaping (Int, Int) -> Bool, elements : [Int] = []) {
		self.sort = sort
		self.elements = elements
		if !elements.isEmpty {
			for i in stride(from : elements.count / 2 - 1, through : 0, by : -1) {
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
		return (2 * index) + 2
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
		var p = parent(child)
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
		elements.swapAt(0, n - 1)
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

func minSum(_ arr : [Int], _ n : Int, _ k : Int) -> Double {
	guard !arr.isEmpty else {
		return 0.0
	}
	var h = Heap(sort : >, elements : arr)
	for _ in 1...n {
		var tmp = 0.0
		if let m = h.remove() {
			tmp = Double(m)
			if tmp < Double(k) {
				tmp = 0.0
			} else {
				let p = tmp * 0.1
				if Double(k) > p {
					tmp = tmp - Double(k)
				} else {
					tmp = tmp - p
				}
			}
			h.insert(Int(tmp))
		}
	}
	var sum : Double = 0.0
	for e in h.elements {
		sum += Double(e)
	}
	return floor(sum)
}

let s = minSum(arr, 2, 10)
print(s)