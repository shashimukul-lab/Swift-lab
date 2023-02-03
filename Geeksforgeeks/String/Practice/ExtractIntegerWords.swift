// Given a string s, extract all the integers from s. 

//let str = "1: Prakhar Agrawal, 2: Manish Kumar Rai, 3: Rishabh Gupta56"
let str = "geeksforgeeks"

func extractIntegerWords(_ str : String) -> [String] {
	guard !str.isEmpty else {
		return []
	}
	var res = [String]()
	var index = str.startIndex
	while index != str.endIndex {
		if str[index].isNumber {
			var numStr = String(str[index])
			index = str.index(after : index)
			while index != str.endIndex && str[index].isNumber {
				numStr += String(str[index])
				index = str.index(after : index)
			}
			res.append(numStr)
		} else {
			index = str.index(after : index)
		}
	}
	return res
}

let res = extractIntegerWords(str)
print(res)
