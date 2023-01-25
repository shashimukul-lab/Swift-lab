//You are given N elements, you can remove any two elements from the list, note their sum, and add the sum to the list. 
//Repeat these steps while there is more than a single element in the list. The task is to minimize the sum of these chosen sums.

//let arr = [1, 4, 7, 10]
let arr = [1, 3, 7, 5, 6]

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

func minimizeSum(_ arr : [Int]) -> Int {
	guard !arr.isEmpty else {
		return 0
	}
	var h = Heap(sort : <, elements : arr)
	var sum = 0
	while h.count > 1 {
		var tmpSum = 0
		if let n1 = h.remove() {
			tmpSum += n1
		}
		if let n2 = h.remove() {
			tmpSum += n2
		}
		sum += tmpSum
		h.insert(tmpSum)
	}
	return sum
}

let s = minimizeSum(arr)
print(s)