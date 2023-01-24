// Given an array A[] of N positive integers and two positive integers K1 and K2. 
//Find the sum of all elements between K1th and K2th smallest elements of the array.
//It may be assumed that (1 <= k1 < k2 <= n).

//let arr = [20, 8, 22, 4, 12, 10, 14]
let arr = [10, 2, 50, 12, 48, 13]
let k1 = 2
let k2 = 6

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

	var count : Int {
		return elements.count
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
			let left = leftChild(parent)
			let right = rightChild(parent)
			var candidate = parent
			if left < count && sort(elements[left], elements[candidate]) {
				candidate = left
			}
			if right < count && sort(elements[right], elements[candidate]) {
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

func sumBetweenTwoKth(_ arr : [Int], _ k1 : Int, _ k2 : Int) -> Int {
	var h = Heap(sort : <, elements : arr)
	for _ in 1...k1 {
		h.remove()
	}
	var sum = 0
	for _ in k1+1..<k2 {
		if let e = h.remove() {
			sum += e
		}
	}
	return sum 
}

let s = sumBetweenTwoKth(arr, k1, k2)
print(s)