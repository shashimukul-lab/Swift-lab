// Generate all possible subarrays

let arr = [1, 2, 3, 4]

func subArray(_ arr : [Int]) {
	guard !arr.isEmpty else {
		return
	}
	let n = arr.count
	for i in 0..<n {
		for j in i..<n {
			for k in i...j {
				print(arr[k], terminator : " ")
			}
			print("")
		}
	}
}

subArray(arr)