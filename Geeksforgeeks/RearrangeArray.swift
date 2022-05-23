//Rearrange an array such that arr[i] = i

//Input
var arr = [-1, -1, 6, 1, 9, 3, 2, -1, 4, -1]
//var arr = [19, 7, 0, 3, 18, 15, 12, 6, 1, 8,
//              11, 10, 9, 5, 13, 16, 2, 14, 17, 4]

//Method 1 :
// func fixArray(_ arr : inout [Int]) {
// 	guard !arr.isEmpty else {
// 		return
// 	}
// 	for i in 0..<arr.count {
// 		for j in 0..<arr.count {
// 			if arr[j] == i {
// 				let tmp = arr[j]
// 				arr[j] = arr[i]
// 				arr[i] = tmp
// 				break
// 			}
// 		}
// 	}
// 	print(arr)
// }

//Method 2 :
// func fixArray(_ arr : inout [Int]) {
// 	guard !arr.isEmpty else {
// 		return
// 	}
// 	for i in 0..<arr.count {
// 		if arr[i] != -1 && arr[i] != i {
// 			var x = arr[i]
// 			while(arr[x] != -1 && arr[x] != x) {
// 				let y = arr[x]
// 				arr[x] = x
// 				x = y
// 			} 
// 			arr[x] = x
// 			if arr[i] != i {
// 				arr[i] = -1
// 			}
// 		}
// 	}
// 	print(arr)
// }

//Method 3 : 
// func fixArray(_ arr : inout [Int]) {
// 	guard !arr.isEmpty else {
// 		return
// 	}
// 	var tmpSet : Set<Int> = Set<Int>() 
// 	for n in arr {
// 		if n != -1 {
// 			tmpSet.insert(n)
// 		}
// 	}
// 	for i in 0..<arr.count {
// 		if tmpSet.contains(i) {
// 			arr[i] = i
// 		} else {
// 			arr[i] = -1
// 		}
// 	}
// 	print(arr)
// }

//Method 4 : 
func fixArray(_ arr : inout [Int]) {
	guard !arr.isEmpty else {
		return
	}
	var i = 0
	while(i < arr.count) {
		if arr[i] >= 0 && arr[i] != i {
			let tmp = arr[arr[i]]
			arr[arr[i]] = arr[i]
			arr[i] = tmp
		}
		else {
			i = i + 1
		}
	}
	print(arr)
}

fixArray(&arr)