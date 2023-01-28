// Given a sorted array of size N and an integer K, find the position at which K is present in the array using binary search.

//let arr = [1, 2, 3, 4, 5]
let arr = [11, 22, 33, 44, 5]

//Iterative
// func binarySearch(_ arr : [Int], _ k : Int) -> Int {
// 	guard !arr.isEmpty else {
// 		return -1
// 	}
// 	let n = arr.count
// 	//var mid = (n - 1) / 2
// 	var left = 0
// 	var right = n - 1
// 	while left <= right {
// 		let mid = left + (right - left) / 2
// 		if arr[mid] == k {
// 			return mid
// 		}
// 		if k < arr[mid] {
// 			right = mid - 1
// 		} else {
// 			left = mid + 1
// 		}
// 	}
// 	return -1
// }

//Recursive
func binarySearch(_ arr : [Int], _ left : Int, _ right : Int, _ k : Int) -> Int {
	if right >= left {
		let mid = left + (right - left) / 2
		if arr[mid] == k {
			return mid
		}
		if k < arr[mid] {
			return binarySearch(arr, left, mid - 1, k)
		} 
		return binarySearch(arr, mid + 1, right, k)
	}
	return -1
}

let s = binarySearch(arr, 0, arr.count - 1, 445)
print(s)