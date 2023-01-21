// Given a Binary Heap of size N in an array arr[]. Write a program to calculate the height of the Heap.

import Foundation
//let arr = [1, 3, 6, 5, 9, 8]
let arr = [3, 6, 9, 2, 15, 10, 14, 5, 12]

//Method 1

// func heapHeight(_ arr : [Int]) -> Int {
// 	guard !arr.isEmpty else {
// 		return 0
// 	}
// 	return Int(floor(log2(Double(arr.count))))
// }

//Method 2
func heapHeight(_ arr : [Int]) -> Int {
	guard !arr.isEmpty else {
		return 0
	}
	var h = -1
	var i = 0
	while i <= arr.count - 1 {
		h += 1
		i = 2 * i + 1
	}
	return h
}

let h = heapHeight(arr)
print(h)