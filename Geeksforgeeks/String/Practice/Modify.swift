// Given a string consisting of lowercase english alphabets, reverse only the vowels present in it and print the resulting string.

//let str = "geeksforgeeks"
//let str = "practice"
let str = "bcdfg"

func modify(_ str : String) -> String {
	guard !str.isEmpty else {
		return ""      
	}
	let vowels : [Character] = ["a", "e", "i", "o", "u"] 
	var tmpArr : [Character] = []
	for c in str.reversed() {
		if vowels.contains(c) {
			tmpArr.append(c)
		}
	}
	var res = ""
	var i = 0
	for c in str {
		if vowels.contains(c) {
			if i < tmpArr.count {
				res += String(tmpArr[i])
				i += 1
			}
		} else {
			res += String(c)
		}
	}
	return res
}

let res = modify(str)
print(res)