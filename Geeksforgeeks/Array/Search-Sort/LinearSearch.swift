// Code for linearly searching x in arr[]. If x
// is present then return its location, otherwise
// return -1

let arr = [2, 3, 4, 10, 40]

func search(_ arr : [Int], _ x : Int) -> Int {
	for (index, value) in arr.enumerated() {
		if value == x {
			return index 
		}
	}
	return -1
}

//let result = search(arr, 10)
//print(result)

// Recursive Code For Linear Search

func linearSearch(_ arr : [Int], _ size : Int, _ key : Int) -> Int {

	if size == 0 {
		return -1
	}

	if arr[size - 1] == key {
		return size - 1
	} else {
		 return linearSearch(arr, size - 1, key)
	}

}

let result = linearSearch(arr, arr.count, 10)
print(result)