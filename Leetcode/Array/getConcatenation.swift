/*
Given an integer array nums of length n, you want to create an array ans of length 2n where ans[i] == nums[i] and ans[i + n] == nums[i] for 0 <= i < n (0-indexed).

Specifically, ans is the concatenation of two nums arrays.
*/

//let nums = [1, 2, 1]
let nums = [1,3,2,1]

func getConcatenation(_ nums : [Int]) -> [Int] {
	var res = [Int]()
	let n = nums.count
	for i in 0..<2 * n {
		res.append(nums[i % n])
	}
	return res	
}

let res = getConcatenation(nums)
print(res)
