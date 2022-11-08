/*
Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].

Return the array in the form [x1,y1,x2,y2,...,xn,yn]
*/

//let nums = [2,5,1,3,4,7]
//let n = 3
//var nums = [1,2,3,4,4,3,2,1]
//let n = 4
let nums = [1,1,2,2]
let n = 2

func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
	var res = [Int]()
	for i in 0..<n {
		res.append(nums[i])
		res.append(nums[i + n])
	}
	return res        
}

//Second Method
// func shuffle(_ nums : inout [Int], _ n : Int) {
// 	let size = nums.count
// 	for i in n..<size {
// 		nums[i] = nums[i] * 1024 + nums[i - n]
// 	}
// 	var index = 0
// 	for i in n..<size {
// 		nums[index] = nums[i] % 1024
// 		nums[index + 1] = nums[i] / 1024
// 		index += 2
// 	}
// }

let res = shuffle(nums, n)
//shuffle(&nums, n)
print(res)