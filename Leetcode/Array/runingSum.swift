/*
	Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).

Return the running sum of nums.
*/

//let nums = [1,2,3,4]
//let nums = [1,1,1,1,1]
var nums = [3,1,2,10,1]

func runningSum(_ nums : [Int]) -> [Int] {
	var res = [Int]()
	for i in 0..<nums.count {
		var sum = 0 
		for j in 0...i {
			sum += nums[j]
		}
		res.append(sum)
	}
	return res	
}

//Second method
// func runningSum(_ nums : inout [Int]) {
// 	for i in 1..<nums.count {
// 		nums[i] += nums[i - 1]
// 	}
// }

let res = runningSum(nums)
print(res)
