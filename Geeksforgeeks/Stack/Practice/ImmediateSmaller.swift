//Given an integer array Arr of size N. For each element in the array, check whether the right adjacent element
//(on the next immediate position) of the array is smaller. If next element is smaller, update the current index to that element. If not, then -1.


//let arr = [4,2,1,5,3]
let arr = [5, 6, 2, 3, 1, 7]

func immediateSmaller(_ arr : [Int]) -> [Int] {
	guard !arr.isEmpty else {
		return []
	}
	var res = [Int]()
	for i in 0..<arr.count {
		let j = i + 1
		if j < arr.count {
			if arr[i] > arr[j] {
				res.append(arr[j])
			} else {
				res.append(-1)
			}
		} else {
			res.append(-1)
		}
	}
	return res
}

let res = immediateSmaller(arr)
print(res)