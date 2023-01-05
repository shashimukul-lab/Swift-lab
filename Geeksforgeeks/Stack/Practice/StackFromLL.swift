//Stack from Linked List

class Node {
	var data : Int
	var next : Node?

	init(data : Int) {
		self.data = data
		self.next = nil
	}
}

struct LinkedList {
	var head : Node?

	mutating func push(_ data : Int) {
		let node = Node(data : data)
		node.next = head
		head = node
	}

	@discardableResult
	mutating func pop() -> Int? {
		guard head != nil else {
			return nil
		}
		let tmp = head
		head = tmp?.next
		return tmp?.data
	}
}

struct Stack {
	var ll = LinkedList()

	mutating func push(_ x : Int) {
		ll.push(x)
	}

	@discardableResult
	mutating func pop() -> Int? {
		ll.pop()
	}

	static func createStackList() -> Stack {
		var st = Stack()
		for i in 1...5 {
			st.push(i)
		}
		return st
	}
}

extension Stack : CustomStringConvertible {
	
	var description : String {
		guard ll.head != nil else {
			return "Stack is Empty"
		}
		var curr = ll.head
		var str = ""
		while curr != nil {
			str = str + "\(curr!.data)" + "\n"
			curr = curr!.next
		}
		return str
	}


}

var st = Stack.createStackList()
print(st)
print("After pop")
st.pop()
print(st)