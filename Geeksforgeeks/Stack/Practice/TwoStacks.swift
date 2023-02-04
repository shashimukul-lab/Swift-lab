// Your task is to implement  2 stacks in one array efficiently.


struct TwoStack {
	var capacity : Int
	var array : [Int] 

	var top1 : Int
	var top2 : Int

	init(_ capacity : Int) {
		self.capacity = capacity
		array = Array(repeating : 0, count : capacity)
		top1 = -1
		top2 = capacity
	}

	var isStack1Empty : Bool {
		return top1 == -1
	}

	var isStack2Empty : Bool {
		return top2 == array.count
	}

	var isFull : Bool {
		return top1 + 1 == top2
	}

	mutating func push1(_ data : Int) {
		guard !isFull else {
			print("Full capacity, cannot push")
			return
		}
		top1 += 1
		array[top1] = data
	}

	mutating func push2(_ data : Int) {
		guard !isFull else {
			print("Full capacity, cannot push")
			return
		}
		top2 -= 1
		array[top2] = data
	}

	@discardableResult
	mutating func pop1() -> Int? {
		guard !isStack1Empty else {
			return nil
		}
		let e = array[top1]
		//array[top1] = 0
		top1 -= 1
		return e
	}

	@discardableResult
	mutating func pop2() -> Int? {
		guard !isStack2Empty else {
			return nil
		}
		let e = array[top2]
		top2 += 1
		return e
	}

	func printStack1() {
		guard !isStack1Empty else {
			print("Stack1 is empty")
			return
		}
		print("Stack1 is :")
		for i in 0...top1 {
			print(array[i], terminator : " ")
		}
		print()
	}

	func printStack2() {
		guard !isStack2Empty else {
			print("Stack2 is empty")
			return
		}
		print("Stack2 is :")
		for i in (top2...array.count - 1).reversed() {
			print(array[i], terminator : " ")
		}
		print()
	}
}

var st = TwoStack(100)
st.push1(2)
st.push1(3)
st.push2(4)
st.push2(5)
st.push2(6)
st.pop1()
st.pop1()
st.pop2()
st.pop2()
st.printStack1()
st.printStack2()