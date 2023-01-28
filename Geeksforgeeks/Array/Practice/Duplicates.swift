// Given an array a[] of size N which contains elements from 0 to N-1, you need to find all the elements occurring more than once in the given array.

//Note: The extra space is only for the array to be returned.
//Try and perform all operations within the provided array. 

//var arr = [0,3,1,2]
//var arr = [2,3,1,2,3]
var arr = [1, 2, 3, 1, 3, 6, 6]

//First Method
// func duplicates(_ arr : inout [Int]) -> [Int] {
// 	guard !arr.isEmpty else {
// 		return [-1]
// 	}
// 	var i = 0
// 	while i < arr.count {
// 		arr.swapAt(arr[i], arr[arr[i]])
// 		i += 1
// 	}
// 	print(arr)
// 	var res = [Int]()
// 	for i in 0..<arr.count {
// 		if arr[i] != i {
// 			res.append(arr[i])
// 		}
// 	}
// 	if !res.isEmpty {
// 		return res
// 	}
// 	return [-1]
// }

//Second Method
func duplicates(_ arr : inout [Int]) -> [Int] {
	guard !arr.isEmpty else {
		return [-1]
	}
	let n = arr.count
	for i in 0..<n {
		let index = arr[i] % n
		arr[index] += n
	}
	var res = [Int]()
	for i in 0..<n {
		if arr[i] / n >= 2 {
			res.append(i)
		}
	}
	if !res.isEmpty {
		return res
	}
	return [-1]
}

let res = duplicates(&arr)
print(res)
