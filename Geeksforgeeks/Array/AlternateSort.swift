//Print an array in alternate sorted manner.


//let arr = [7, 1, 2, 3, 4, 5, 6]
let arr = [1, 12, 4, 6, 7, 10]

//Method 1
func alternateSort(_ arr : [Int]) -> [Int] {
	guard !arr.isEmpty else {
		return []
	}
	if arr.count == 1 {
		return arr
	}

	var result = [Int]()

	for _ in 0..<arr.count {
		var max = Int.min
		var min = Int.max

		for i in 0..<arr.count {
			if result.contains(arr[i]) {
				continue
			}
			if arr[i] >= max {
				max = arr[i]
			}
			if arr[i] <= min {
				min = arr[i]
			}
		}
		if max != Int.min {
			result.append(max)
		}
		if min != Int.max {
			result.append(min)
		}
	}
	print(result)
	return result
}

//Method 2
// func alternateSort(_ arr : [Int]) -> [Int] {
// 	guard !arr.isEmpty else {
// 		return []
// 	}
// 	let sortedArr = arr.sorted()
// 	var start = 0
// 	var end = sortedArr.count - 1
// 	var result = [Int]()
// 	while start < end {
// 		result.append(sortedArr[end])
// 		end -= 1
// 		result.append(sortedArr[start])
// 		start += 1
// 	}
// 	if (sortedArr.count - 1) % 2 == 0 {
// 		result.append(sortedArr[sortedArr.count / 2])
// 	}
// 	return result
// }

let a = alternateSort(arr)
print(a)