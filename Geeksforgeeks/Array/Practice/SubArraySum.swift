//Function to find a continuous sub-array which adds up to a given number.

//let arr = [1,2,3,7,5]
//let s = 12
//let arr = [1,2,3,4,5,6,7,8,9,10]
//let s = 15

//let arr = [1,2,3,9,5]
//let s = 12

let arr = [1, 2, 3, 4, 5]
let s = 13

func subArraySum(_ arr : [Int], _ s : Int) -> [Int] {
	guard !arr.isEmpty else {
		return [-1]
	}
	var result = [Int]()
	var start = 0
	var end = 0
	var sum = 0
	for i in 0..<arr.count {
		sum = sum + arr[i]

		while sum > s && start <= i {
			sum -= arr[start]
			start += 1
		}
		if sum == s {
			break
		}
		end += 1
		// end = i + 1
		// if sum < s {
		// 	continue
		// } 
		// else if sum == s {
		// 	break
		// } else {
		// 	sum -= arr[start - 1]
		// 	start += 1
		// 	if sum == s {
		// 		break
		// 	}
		// }

	}
	if end >= arr.count {
		return [-1]
	}
	result.append(start + 1)
	result.append(end + 1)
	return result
}

let result = subArraySum(arr, s)
print(result)