// Given an array containing N elements. The task is to find the maximum number of distinct elements after removing K elements from the array. 

let arr = [5, 7, 5, 5, 1, 2, 2]
//let arr = [1, 2, 3, 4, 5, 6, 7]
//let arr = [1, 2, 2, 2]
let k = 3

struct Node {
	var element : Int
	var priority : Int

	init(element : Int, priority : Int) {
		self.element = element
		self.priority = priority
	}
}

extension Node : Comparable {
	
	static func <(lhs : Node, rhs : Node) -> Bool {
		return lhs.priority < rhs.priority
	}

}

struct Heap {
	var elements = [Node]()
	var sort : (Node, Node) -> Bool

	init(sort : @escaping (Node, Node) -> Bool, elements : [Node] = []) {
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
		return 2 * index + 2
	}

	func parent(_ index : Int) -> Int {
		return (index - 1) / 2
	}

	var peek : Node? {
		return elements.first
	}

	mutating func insert(_ element : Node) {
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
	mutating func remove() -> Node? {
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
			if l < count && sort(elements[l], elements[parent]) {
				candidate = l
			}
			if r < count && sort(elements[r], elements[parent]) {
				candidate = r
			}
			if candidate == parent {
				return
			}
			elements.swapAt(parent, candidate)
			parent = candidate
		}
	}

	mutating func decreasePriority() {
		guard var top = peek else {
			return
		}
		let newPriority = top.priority - 1
		top.priority = newPriority
		elements[0] = top
		shiftDown(0)
	} 
}

func maxDistinctNum(_ arr : [Int], _ k : Int) -> Int {
	guard !arr.isEmpty else {
		return 0
	}
	var dict = [Int : Int]()
	for e in arr {
		dict[e, default : 0] += 1 
	}

	var nodeArr = [Node]()
	for (key, value) in dict {
		let n = Node(element : key, priority : value)
		nodeArr.append(n)
	}

	var h = Heap(sort : >, elements : nodeArr)
	for _ in 1...k {
		if !h.isEmpty {
			if let top = h.peek {
				if top.priority > 1 {
					h.decreasePriority()
				} else {
					h.remove()
				}
			}
		}
	}

	return h.elements.filter{ $0.priority <= 1 }.count
}

let distinctNum = maxDistinctNum(arr, k)
print(distinctNum)