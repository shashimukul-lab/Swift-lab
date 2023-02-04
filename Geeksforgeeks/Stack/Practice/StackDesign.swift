// You are given an array arr of size N. You need to push the elements of the array into a stack and then print them while popping.

//let arr = [1, 2, 3, 4, 5]
let arr = [1, 6, 43, 1, 2, 0, 5]

struct Stack {
	var array = [Int]()

	var isEmpty : Bool {
		return array.isEmpty
	}

	mutating func push(_ data : Int) {
		array.append(data)
	}

	@discardableResult
	mutating func pop() -> Int? {
		return array.removeLast()
	}
}

func pushOp(_ arr : [Int]) -> Stack {
	guard !arr.isEmpty else {
		return Stack()
	}
	var st = Stack()
	for e in arr {
		st.push(e)
	}
	return st
}

func popOp(_ st : Stack) {
	guard !st.isEmpty else {
		print("Stack is empty")
		return
	}
	var s = st
	while !s.isEmpty {
		if let e = s.pop() {
			print(e, terminator : " ")
		}
	}
	print()
}

let st = pushOp(arr)
popOp(st)