// Given a list of names, display the longest name.

// let strArr = ["Geek", "Geeks", "Geeksfor",
//   "GeeksforGeek", "GeeksforGeeks"]

let strArr = ["abcd", "abcdef", "rty"]


func longest(_ arr : [String]) -> String? {
	
	guard !arr.isEmpty else {
		return nil
	}

	var maxStr = arr[0]  
	for i in 1..<arr.count {
		let l = arr[i].count
		if l >= maxStr.count {
			maxStr = arr[i]
		}
	}
	return maxStr
}

if let maxStr = longest(strArr) {
	print(maxStr)
}