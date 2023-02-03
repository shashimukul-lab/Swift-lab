// Given an array of N integers, and an integer K, find the number of pairs of elements in the array whose sum is equal to K.

//let arr = [1, 5, 7, 1]
//let arr = [1, 1, 1, 1]
//let arr = [1, 5, 7, -1]
//let arr = [1, 5, 7, -1, 5]
let arr = [10, 12, 10, 15, -1, 7, 6, 5, 4, 2, 1, 1, 1]
let k = 11

//Method 1
// func getPairsCount(_ arr : [Int], _ k : Int) -> Int {
// 	guard !arr.isEmpty else {
// 		return 0
// 	}
// 	var dict = [Int : Int]()
// 	for e in arr {
// 		dict[e, default : 0] += 1
// 	}
// 	//print(dict)
// 	var count = 0
// 	for e in arr {
// 		if dict[k - e] != nil {
// 			count += dict[k - e]!
// 		}
// 		if k - e == e {
// 			count -= 1
// 		}
// 	}
// 	return count / 2
// }


func getPairsCount(_ arr : [Int], _ k : Int) -> Int {
	guard !arr.isEmpty else {
		return 0
	}
	var dict = [Int : Int]()
	var count = 0
	for e in arr {
		if dict[k - e] != nil {
			count += dict[k - e]!
		} 
		dict[e, default : 0] += 1
	}
	return count
}

let c = getPairsCount(arr, k)
print(c)