//Write a program to implement a Stack using Array.

struct Stack {
	var arr = [Int]()

	mutating func push(_ x : Int) {
		arr.append(x)
	}

	mutating func pop() -> Int? {
		return arr.popLast()
	}
} 

extension Stack : CustomStringConvertible {
	
	var description : String {
		let stackElements = arr.reversed().map { "\($0)" }.joined(separator : "\n")
		return stackElements
	}

}

var st = Stack()
st.push(2)
st.push(3)
let _ = st.pop()
st.push(4)
//st.pop()
print(st)