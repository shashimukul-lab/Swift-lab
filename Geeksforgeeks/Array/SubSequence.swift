// Generate all possible subsequences

import Foundation

let arr = [1, 2, 3, 4]

func printSubsequences(_ arr : [Int]) {
	guard !arr.isEmpty else {
		return
	}
	let n = arr.count
	let opSize : UInt = UInt(pow(2.0, Double(n)))
	for counter in 1..<opSize {
		for j in 0..<n {
			//print("data \(counter & (1 << j))")
			//print("counter \(counter)")
			//print("shift \(1 << j)")
			if (counter & 1 << j) != 0 {
				print(arr[j], terminator : " ")
			}
		}
		print("")
	}
}

printSubsequences(arr)