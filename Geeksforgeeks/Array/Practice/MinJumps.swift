//Given an array of N integers arr[] where each element represents the max length of the jump that can be made forward from that element. 
//Find the minimum number of jumps to reach the end of the array (starting from the first element).
//If an element is 0, then you cannot move through that element.

let arr = [1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]
//let arr = [1, 4, 3, 2, 6, 7]
//let arr = [1, 0, 0, 0]
//let arr = [1, 1, 1, 1]

func minJumps(_ arr : [Int]) -> Int {
	guard !arr.isEmpty else {
		return -1
	}
	var i = 0
	var count = 0

	while i <= arr.count - 1 {
		if i < arr.count - 1 && arr[i] == 0 {
			return -1
		}
		let n = arr[i]
		//print("i = \(i)")
		i = i + n
		count += 1
		if i >= arr.count - 1 {
			break
		} 
		
	}
	if count == 0 {
		return -1
	}
	return count
}

let c = minJumps(arr)
print(c)