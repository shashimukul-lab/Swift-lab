// Given an array A of size N, the task is to check if the given array represents a Binary Max Heap.

//let arr = [90, 15, 10, 7, 12, 2]
let arr = [9, 15, 10, 7, 12, 11]

func isMaxHeap(_ arr : [Int]) -> Bool {
	guard !arr.isEmpty else {
		return false
	}
	for i in 0..<arr.count / 2 {
		let value = arr[i]
		var leftValue : Int?
		var rightValue : Int?
		if 2 * i + 1 < arr.count {
			leftValue = arr[2 * i + 1]
		}
		if 2 * i + 2 < arr.count {
			rightValue = arr[2 * i + 2]
		}  
		if let leftValue = leftValue, leftValue >= value {
			return false
		}
		if let rightValue = rightValue, rightValue >= value {
			return false
		}
	}
	return true
}

let res = isMaxHeap(arr)
print(res)