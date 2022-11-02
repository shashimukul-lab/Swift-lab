/*
Given a zero-based permutation nums (0-indexed), build an array ans of the same length where ans[i] = nums[nums[i]] for each 0 <= i < nums.length and return it.

A zero-based permutation nums is an array of distinct integers from 0 to nums.length - 1 (inclusive).
*/

var nums = [0,2,1,5,3,4]
//var nums = [5,0,1,2,3,4]

// func buildArray(_ nums: [Int]) -> [Int] {
// 	var res = [Int]()
// 	for i in 0..<nums.count {
// 		res.append(nums[nums[i]])
// 	}
// 	return res
// }

// let res = buildArray(nums)
// print(res)

// Build Array without using extra space

func buildArray(_ nums : inout [Int]) {
	let b = nums.count
	for i in 0..<nums.count {
		let r = nums[i]
		let q = nums[nums[i]] % b
		nums[i] = b * q + r
	}

	for i in 0..<nums.count {
		nums[i] = nums[i] / b
	}
}

buildArray(&nums)
print(nums)