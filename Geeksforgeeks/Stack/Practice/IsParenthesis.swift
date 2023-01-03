//Given an expression string x. Examine whether the pairs and the orders of “{“,”}”,”(“,”)”,”[“,”]” are correct in exp.
//For example, the function should return 'true' for exp = “[()]{}{[()()]()}” and 'false' for exp = “[(])”.

//let s = "{([])}"
//let s = "()"
let s = "([]"

struct Stack {
	var arr = [Character]()

	mutating func push(_ s : Character) {
		arr.append(s)
	}

	mutating func pop() -> Character? {
		guard !arr.isEmpty else {
			return nil
		}

		return arr.popLast()
	}
}

extension Stack {

	var isEmpty : Bool {
		return arr.isEmpty
	}

	var top : Character? {
		return arr.last
	}

}

extension Stack : CustomStringConvertible {
	
	var description : String {
		guard !arr.isEmpty else {
			return "Stack is empty"
		}
		let stackElements = arr.reversed().map { "\($0)" }.joined(separator : "\n")
		return stackElements
	}

}

//var st = Stack()
//st.push("1")
//st.push("2")
//st.push("3")
//st.push("4")
//print(st)

func isPar(_ s : String) -> Bool {
	guard !s.isEmpty else {
		return false
	}
	var i = s.startIndex
	//print(type(of : s[start]))
	var st = Stack()
	st.push(s[i])
	i = s.index(after : i)
	while i != s.endIndex {
		if let top = st.top {
			if (top == "{" && s[i] == "}") || (top == "(" && s[i] == ")") || (top == "[" && s[i] == "]") {
				let _ = st.pop()
			}
		} else {
			st.push(s[i])	
		}
		
		i = s.index(after : i)
	}
	//print("stack is \(st)")
	return st.isEmpty
}

let res = isPar(s)
print(res)