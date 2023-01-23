// Given a Binary Heap of size N in an array arr[]. Write a program to calculate the height of the Heap.

import Foundation
//let arr = [1, 3, 6, 5, 9, 8]
let arr = [3, 6, 9, 2, 15, 10, 14, 5, 12]

func heapHeight(_ arr : [Int]) -> Int? {
	guard !arr.isEmpty else {
		return nil
	}
	return Int(log2(Double(arr.count)))
}

if let h = heapHeight(arr) {
	print(h)	
}
