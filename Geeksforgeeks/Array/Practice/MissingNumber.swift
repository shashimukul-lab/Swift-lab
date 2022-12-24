//Given an array of size N-1 such that it only contains distinct integers in the range of 1to N. Find the missing element.

let arr = [6,1,2,8,3,4,7,10,5]
let n = 10

//let arr = [1,2,3,5]
//let n = 5


//May cause overflow
// func missingNumber(_ arr : [Int], _ n : Int) -> Int {

// 	guard !arr.isEmpty else {
// 		return Int.min 
// 	} 

// 	var sum1 = 0
// 	for e in 1...n {
// 		sum1 += e
// 	}
// 	var sum2 = 0
// 	for i in 0..<arr.count {
// 		sum2 = sum2 + arr[i]
// 	}

// 	return sum1 - sum2
// }

func missingNumber(_ arr : [Int], _ n : Int) -> Int {

	guard !arr.isEmpty else {
		return Int.min 
	} 

	var x1 = arr[0]
	for i in 1..<arr.count {
		x1 = x1 ^ arr[i]
	}
	var x2 = 1
	for e in 2...n {
		x2 = x2 ^ e
	}

	return x1 ^ x2
}

let m = missingNumber(arr, n)
print(m)