/* 
Given a stack of integers of size N, your task is to complete the function pairWiseConsecutive(), 
that checks whether numbers in the stack are pairwise consecutive or not. 
The pairs can be increasing or decreasing, and if the stack has an odd number of elements, the element at the top is left out of a pair. 
The function should retain the original stack content.

Only following standard operations are allowed on stack.

    push(X): Enter a element X on top of stack.
    pop(): Removes top element of the stack.
    empty(): To check if stack is empty.
*/

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

func pairWiseConsecutive(_ s : Stack) -> Bool {
	guard !s.isEmpty else {
		return false
	}
	var originalStack = s
	var st = Stack()
	while !originalStack.isEmpty {
		if let e = originalStack.pop() {
			st.push(e)
		}
	}
	var res = true
	while !st.isEmpty {
		var first : Int?
		var second : Int?
		if let e = st.pop() {
			first = e
			originalStack.push(e)
		}
		if !st.isEmpty, let e = st.pop() {
			second = e
			originalStack.push(e)
		} else {
			break
		}
		if let f = first, let s = second {
			if abs(f - s) != 1 {
				res = false
			}
		}
	}
	return res
}

// var st = Stack()
// st.push(1)
// st.push(2)
// st.push(3)
// st.push(4)
// st.push(5)
// st.push(6)
// let r = pairWiseConsecutive(st)
// print(r)

var st = Stack()
st.push(1)
st.push(5)
st.push(3)
st.push(9)
st.push(7)
let r = pairWiseConsecutive(st)
print(r)