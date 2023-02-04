// Given array A[] of integers, the task is to complete the function findMaxDiff 
//which finds the maximum absolute difference between nearest left and right smaller element of every element in array.
//If the element is the leftmost element, nearest smaller element on left side is considered as 0. 
//Similarly if the element is the rightmost elements, smaller element on right side is considered as 0.

//let arr = [2, 1, 8]
//let arr = [2, 4, 8, 7, 7, 9, 3]
let arr = [5, 1, 9, 2, 5, 1, 7]

struct Stack {
	var array = [Int]()

	var isEmpty : Bool {
		return array.isEmpty
	}

	var top : Int? {
		return array.last
	}

	mutating func push(_ data : Int) {
		array.append(data)
	}

	@discardableResult
	mutating func pop() -> Int? {
		return array.removeLast()
	}
}

func leftSmaller(_ arr : [Int]) -> [Int] {
	var leftSmallerArr = Array(repeating : 0, count : arr.count)
	var st = Stack()
	for i in 0..<arr.count {
		while !st.isEmpty, let t = st.top, t > arr[i] {
			st.pop()
		}
		if !st.isEmpty {
			if let t = st.top {
				leftSmallerArr[i] = t
			}
		} else {
			leftSmallerArr[i] = 0
		}
		st.push(arr[i])
	}
	return leftSmallerArr
}

func findMaxDiff(_ arr : [Int]) -> Int? {
	guard !arr.isEmpty else {
		return nil
	}
	let n = arr.count
	let leftSmallerArr = leftSmaller(arr)
	let rightSmallerArr = leftSmaller(arr.reversed())
	var result = -1
	for i in 0..<arr.count {
		result = max(result, abs(leftSmallerArr[i] - rightSmallerArr[n - 1 - i]))
	}
	return result
}

let res = findMaxDiff(arr)
print(res!)