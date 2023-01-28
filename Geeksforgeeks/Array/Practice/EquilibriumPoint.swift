// Given an array A of n positive numbers. The task is to find the first Equilibrium Point in an array. 
//Equilibrium Point in an array is a position such that the sum of elements before it is equal to the sum of elements after it.
//Note: Retun the index of Equilibrium point. (1-based index)

//let arr = [1,3,5,2,2]
//let arr = [1]
//let arr = [1, 2, 5, 4, 7]
//let arr = [4, 5, 2, 2]
let arr = [-7, 1, 5, 2, -4, 3, 0]

//First Method
// func equilibriumPoint(_ arr : [Int]) -> Int? {
// 	guard !arr.isEmpty else {
// 		return nil
// 	}
// 	if arr.count == 1 {
// 		return 1
// 	}
// 	var sum1 = 0
// 	var left = 0
// 	var sum2 = 0
// 	var right = arr.count - 1
// 	while left != right {
// 		if sum1 == 0 && sum2 == 0 {
// 			sum1 += arr[left]
// 			sum2 += arr[right]
// 			continue
// 		}
// 		if sum1 >= sum2 {
// 			right -= 1
// 			sum2 += arr[right]
// 		} else {
// 			left += 1
// 			sum1 += arr[left]
// 		}
// 	}
// 	if sum1 == sum2 {
// 		return left + 1
// 	}
// 	return nil
// }

//Second Method
func equilibriumPoint(_ arr : [Int]) -> Int? {
	guard !arr.isEmpty else {
		return nil
	}
	if arr.count == 1 {
		return 1
	}
	var sum = 0
	var leftSum = 0
	for e in arr {
		sum += e
	}
	for i in 0..<arr.count {
		sum -= arr[i]
		if sum == leftSum {
			return i + 1
		}
		leftSum += arr[i]
	}
	return nil
}

if let res = equilibriumPoint(arr) {
	print(res)
}