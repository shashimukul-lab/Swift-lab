//Rotates array of size n by d elements

var arr = [1, 2, 3, 4, 5, 6, 7]
//var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

//Method 1:
// func rotate(_ arr : inout [Int], _ d : Int) {
// 	guard !arr.isEmpty else {
// 		return
// 	}
// 	guard d <= arr.count else {
// 		return
// 	}
// 	let n = arr.count
// 	var tmpArr = [Int]()
// 	for i in 0..<d {
// 		tmpArr.append(arr[i])
// 	}
// 	for i in d..<n {
// 		arr[i - d] = arr[i]
// 	}
// 	for i in 0..<d {
// 		arr[n - d + i] = tmpArr[i]
// 	}
// }

//Method 2:
// func rotate(_ arr : inout [Int], _ d : Int) {
// 	guard !arr.isEmpty else {
// 		return
// 	}
// 	guard d <= arr.count else {
// 		return
// 	}
// 	for _ in 0..<d {
// 		rotateByOne(&arr)
// 	}
// }

// func rotateByOne(_ arr : inout [Int]) {
// 	guard !arr.isEmpty else {
// 		return
// 	}
// 	let tmp = arr[0]
// 	let n = arr.count
// 	for i in 1..<n {
// 		arr[i - 1] = arr[i]
// 	}
// 	arr[n - 1] = tmp
// }

//Method 3:
func gcd(_ a : Int, _ b : Int) -> Int {
	if b == 0 {
		return a
	}
	return gcd(b, a % b)
}

func rotate(_ arr : inout [Int], _ d : Int) {
	guard !arr.isEmpty else {
		return
	}
	// guard d <= n else {
	// 	return
	// }
	let n = arr.count
	let d1 = d % n
	let g = gcd(n, d1)
	for i in 0..<g {
		let temp = arr[i]
		var j = i
		while(true) {
			var k = j + d
			if (k >= n) {
				k = k - n
			}
			if (k == i) {
				break
			}
			arr[j] = arr[k]
			j = k
		}
		arr[j] = temp
	}
}

rotate(&arr, 2)
print(arr)