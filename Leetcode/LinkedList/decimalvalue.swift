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
let node2 = Node(data : 0)
let node3 = Node(data : 1)
let node4 = Node(data : 1)

node1.next = node2
node2.next = node3
node3.next = node4
	
class Solution {

	init() {}

	func getDecimalValue(_ head : Node?) -> Int {

		var curr = head
		var res = 0
		while( curr != nil ) {
			res = res * 2 + curr!.data
			curr = curr!.next
		}
		return res
	}

}

let s = Solution()
print(s.getDecimalValue(node1))

