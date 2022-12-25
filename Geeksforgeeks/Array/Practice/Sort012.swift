//Given an array of size N containing only 0s, 1s, and 2s; sort the array in ascending order.

let arr = [0, 2, 1, 2, 0]
//let arr = [0, 1, 0]

func sort012(_ arr : [Int]) -> [Int] {
	guard !arr.isEmpty else {
		return []
	}

	//var dict = [Int : Int]()
	var c1 = 0
	var c2 = 0
	var c3 = 0
	var res = [Int]()
	// for e in arr {
	// 	// if let n = dict[e] {
	// 	// 	dict[e] = n + 1
	// 	// } else {
	// 	// 	dict[e] = 1
	// 	// }
	// 	dict[e, default : 0] += 1
	// }
	for e in arr {
		if e == 0 {
			c1 += 1
		}
		if e == 1 {
			c2 += 1
		}
		if e == 2 {
			c3 += 1
		} 
	}
	// if let n = dict[0] {
	// 	for _ in 1...n {
	// 		res.append(0)
	// 	}
	// }
	// if let n = dict[1] {
	// 	for _ in 1...n {
	// 		res.append(1)
	// 	}
	// }
	// if let n = dict[2] {
	// 	for _ in 1...n {
	// 		res.append(2)
	// 	}
	// }

	for _ in 1...c1 {
		res.append(0)
	}
	for _ in 1...c2 {
		res.append(1)
	}
	for _ in 1...c3 {
		res.append(2)
	}

	return res
}

let res = sort012(arr)
print(res)