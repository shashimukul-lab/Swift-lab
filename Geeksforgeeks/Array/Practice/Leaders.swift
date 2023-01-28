// Given an array A of positive integers. Your task is to find the leaders in the array. 
// An element of array is leader if it is greater than or equal to all the elements to its right side. 
//The rightmost element is always a leader.

//let arr = [16, 17, 4, 3, 5, 2]
let arr = [1,2,3,4,0]

func leaders(_ arr : [Int]) -> [Int] {
	guard !arr.isEmpty else {
		print("No leader present")
		return []
	}
	var res = [Int]()
	res.append(arr[arr.count - 1])
	var max = arr[arr.count - 1]
	for i in (0..<arr.count - 1).reversed() {
		if arr[i] >= max {
			res.insert(arr[i], at : 0)
			max = arr[i]
		}
	}
	return res
} 

let res = leaders(arr)
print(res)