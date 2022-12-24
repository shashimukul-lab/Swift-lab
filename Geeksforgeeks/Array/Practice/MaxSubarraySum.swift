// Given an array Arr[] of N integers. Find the contiguous sub-array(containing at least one number) which has the maximum sum and return its sum.


//let arr = [1,2,3,-2,5]
//let arr = [-5,-1,-2,-3,-4]
//let arr = [-2, -3, 4, -1, -2, 1, 5, -3]
//let arr = [-10, 5]
let arr = [1, -3, 3, -1, 5, 1]

// func maxSubArraySum(_ arr : [Int]) -> Double? {
// 	guard !arr.isEmpty else {
// 		 return nil
// 	}
// 	guard arr.count > 1 else {
// 		return Double(arr[0])
// 	}

// 	var prevMaxSum = arr[0]
// 	var currMaxSum = arr[0]

// 	for i in 1..<arr.count {
// 		let tmpSum = currMaxSum + arr[i]
// 		if tmpSum < 0 {
// 			if currMaxSum > prevMaxSum {
// 				prevMaxSum = currMaxSum
// 			}
// 			if arr[i] > 0 {
// 				currMaxSum = arr[i]
// 			} else {
// 				currMaxSum = 0
// 			}
// 		} else {
// 			currMaxSum = tmpSum	
// 		}
		
// 	}
// 	if prevMaxSum > currMaxSum {
// 		return Double(prevMaxSum)
// 	}
// 	return Double(currMaxSum)
// }


func maxSubArraySum(_ arr : [Int]) -> Double? {
	guard !arr.isEmpty else {
		 return nil
	}
	var prevMax = Int.min
	var currMax = 0
	for i in 0..<arr.count {
		currMax = currMax + arr[i]
		if prevMax < currMax {
			prevMax = currMax
		}
		if currMax < 0 {
			currMax = 0
		}
	}
	return Double(prevMax)
}

if let maxSum = maxSubArraySum(arr) {
	print(maxSum)	
}
