// Given an array of N positive integers, print k largest elements from the array.

let arr = [12,5,787,1,23]
let k = 2

struct Heap {
	var elements = [Int]()
	var sort : (Int, Int) -> Bool

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

	func leftChild(_ index : Int) -> Int {
		return 2 * index + 1
	}

	func rightChild(_ index : Int) -> Int {
		return 2 * index + 2
	}

	func parent(_ index : Int) -> Int {
		return (index - 1) / 2
	}

	mutating func insert(_ element : Int) {
		elements.append(element)
		shiftUp(elements.count - 1)
	}

	mutating func shiftUp(_ index : Int) {
		var child = index
		var p = parent(index)
		while child > 0 && sort(elements[child], elements[p]) {
			elements.swapAt(elements[child], elements[p])
			child = p
			p = parent(child)
		} 
	}

	mutating func remove() -> Int? {
		guard !isEmpty else {
			return nil
		}
		elements.swapAt(0, elements.count - 1)
		defer {
			shiftDown(0)
		}
		return elements.removeLast()
	}

	mutating func shiftDown(_ index : Int) {
		var parent = index
		while true {
			let left = leftChild(parent)
			let right = rightChild(parent)
			var candidate = parent
			if left <= elements.count - 1 && sort(elements[left], elements[candidate]) {
				candidate = left
			}
			if right <= elements.count - 1 && sort(elements[right], elements[candidate]) {
				candidate = right
			}
			if candidate == parent {
				return
			}
			elements.swapAt(parent, candidate)
			parent = candidate
		}
	}
}

class Solution {
	
	static func kLargest(_ arr : [Int], _ k : Int) {
		var h = Heap(sort : >, elements : arr)
		for _ in 1...k {
			if let e = h.remove() {
				print(e)	
			}
			
		}
	} 

}

Solution.kLargest(arr, k)