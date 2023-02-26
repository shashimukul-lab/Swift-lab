// Given a 2d list that represents the nodes of a Binary tree with N nodes,
// the task is to find the maximum GCD of the siblings of this tree without actually constructing it.

//let arr = [[4, 5], [4, 2], [2, 3], [2, 1], [3, 6], [3, 12]]
let arr = [[1,2], [1,4]]

func maxBinTreeGCD(_ arr : [[Int]]) -> Int {
	guard !arr.isEmpty else {
		return 0
	}
	if arr.count == 1 {
		return 0
	}
	var i = 0
	var maxG = 0
	while i < arr.count {
		let firstNode = arr[i]
		i += 1
		if i >= arr.count {
			break
		}
		let secondNode = arr[i]
		var g = 0
		if let p1 = firstNode.first, let p2 = secondNode.first, p1 == p2 {
			if let c1 = firstNode.last, let c2 = secondNode.last {
				g = gcd(c1, c2)
			}
		}
		else {
			break
		}
		if g > maxG {
			maxG = g
		}
		i += 1
	}
	return maxG
}

func gcd(_ a : Int, _ b : Int) -> Int {
	if b == 0{
		return a
	}
	return gcd(b, a % b)
}

let res = maxBinTreeGCD(arr)
print(res)