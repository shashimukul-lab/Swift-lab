//Let's give it a try! You have a linked list and you have to implement the functionalities push and pop of stack using this given linked list. 

class Node {
	var data : Int
	var next : Node?

	init(_ data : Int) {
		self.data = data
		self.next = nil
	}
}

extension Node : CustomStringConvertible {
	
	var description : String {
		guard let next = next else {
			return "\(data)"
		}
		return "\(data)" + " -> " + next.description
	}

}

struct LinkedList {
	var head : Node?

	var isEmpty : Bool {
		return head == nil
	}

	mutating func push(_ data : Int) {
		let node = Node(data)
		node.next = head
		head = node
	}

	@discardableResult
	mutating func pop() -> Int? {
		guard !isEmpty else {
			return nil
		}
		let node = head
		head = node?.next
		return node?.data
	}
}

struct Stack {
	var ll = LinkedList()

	var isEmpty : Bool {
		return ll.isEmpty
	}

	mutating func push(_ data : Int) {
		ll.push(data)
	}

	@discardableResult
	mutating func pop() -> Int? {
		guard !isEmpty else {
			return nil
		}
		return ll.pop()
	}
}

extension Stack : CustomStringConvertible {

	var description : String {
		guard !isEmpty else {
			return "List is empty"
		}
		return ll.head!.description
	}

}

var st = Stack()
st.push(2)
st.push(3)
print(st.pop()!)
st.push(4)
print(st.pop()!)
//print(st)