class Node {
	var data : Int
	var next : Node?

	init(data : Int) {
		self.data = data
		self.next = nil
	}
}

extension Node : CustomStringConvertible {
	
	var description : String {
		guard let next = next else {
			return "\(data)"
		}
		return "\(data) -> " + String(describing : next) + " "
	}

}

let node1 = Node(data : 1)
let node2 = Node(data : 2)
let node3 = Node(data : 3)
let node4 = Node(data : 4)
let node5 = Node(data : 5)
//let node6 = Node(data : 6)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
//node5.next = node6
//print(node1)

class Solution {

	init() {}

	func middleNode(_ head : Node?) -> Node? {
		guard let head = head else {
			return nil
		}

		guard head.next != nil else {
			return head
		}

		var curr = head
		var mid = head
		while let next = curr.next {
			curr = next
			mid = mid.next!
			if curr.next != nil {
				curr = curr.next!
			}
		}
		return mid
	}

}

let s = Solution()
let mid = s.middleNode(node1)
print(mid!)
//print(mid?.data ?? Int.min)