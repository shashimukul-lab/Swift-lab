//K’th Smallest/Largest Element in Unsorted Array

//Input
let arr = [7, 10, 4, 3, 20, 15]
let k = 3

//Method 1

func kthSmallest(_ arr : [Int], _ k : Int) -> Int {
	guard !arr.isEmpty else {
		return Int.min
	}
	let sortedArr = arr.sorted(by : <)
	print(sortedArr)
	return sortedArr[k - 1]
}

print(kthSmallest(arr, k))