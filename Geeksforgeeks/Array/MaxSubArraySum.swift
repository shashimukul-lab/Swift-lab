// Largest Sum Contiguous Subarray

//Input
let arr = [-2, -3, 4, -1, -2, 1, 5, -3]
//let arr = [2, 3, 4]

//Method 1 :
// func maxSubArraySum(_ arr : [Int]) -> Int {
// 	guard !arr.isEmpty else {
// 		return Int.min
// 	}
// 	var maxSoFar = Int.min
// 	var maxEndingHere = 0

// 	for i in arr {
// 		maxEndingHere = maxEndingHere + i
// 		if maxSoFar < maxEndingHere {
// 			maxSoFar = maxEndingHere
// 		}
// 		if maxEndingHere < 0 {
// 			maxEndingHere = 0
// 		}
// 	}
// 	return maxSoFar
// }

//Method 2 :
// func maxSubArraySum(_ arr : [Int]) -> Int {
// 	guard !arr.isEmpty else {
// 		return Int.min
// 	}
// 	var maxSoFar = Int.min
// 	var maxEndingHere = 0

// 	for i in arr {
// 		if i <= maxEndingHere + i {
// 			maxEndingHere += i
// 		} else {
// 			maxEndingHere = i
// 		}
// 		if maxSoFar < maxEndingHere {
// 			maxSoFar = maxEndingHere
// 		}
// 	}
// 	return maxSoFar
// }


//Method 3 :
// func maxSubArraySum(_ arr : [Int]) -> Int {
// 	guard !arr.isEmpty else {
// 		return Int.min
// 	}
// 	var maxSoFar = arr[0]
// 	var currMax = arr[0]

// 	for i in 1..<arr.count {
// 		currMax = max(arr[i], currMax + arr[i])
// 		maxSoFar = max(maxSoFar, currMax)
// 	}
// 	return maxSoFar
// }

//Method 4 :
func maxSubArraySum(_ arr : [Int]) -> Int {
	guard !arr.isEmpty else {
		return Int.min
	}
	var maxSoFar = Int.min
	var maxEndingHere = 0
	var start = 0
	var end = 0
	var s = 0
	for i in 0..<arr.count {
		maxEndingHere += arr[i]
		if maxSoFar <= maxEndingHere {
			maxSoFar = maxEndingHere
			start = s
			end = i
		}
		if maxEndingHere < 0 {
			maxEndingHere = 0
			s = s + 1
		}
	}
	print(start, end)
	return maxSoFar
}

// func maxSubArraySum(_ arr : [Int]) -> Int {
// 	guard !arr.isEmpty else {
// 		return Int.min
// 	}
// 	var prevSum = arr[0]
// 	for i in 1..<arr.count {
// 		prevSum += arr[i]
// 	}
// 	var firsIndex = 0
// 	var lastIndex = arr.count - 1
// 	var currentSum = prevSum
// 	while(currentSum >= prevSum) {
// 		prevSum = currentSum
// 		if arr[firsIndex] <= arr[lastIndex] {
// 			currentSum = prevSum - arr[firsIndex]
// 			firsIndex = firsIndex + 1
// 		} else {
// 			currentSum = prevSum - arr[lastIndex]
// 			lastIndex = lastIndex - 1
// 		} 
// 		//print(firsIndex, lastIndex, currentSum, prevSum)
// 	}
// 	return prevSum
// }

let res = maxSubArraySum(arr)
print(res)