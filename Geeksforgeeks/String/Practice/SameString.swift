//Given a string, check if all its characters are the same or not.

let str = "geeks"
//let str = "ggggg"
//let str = "g"

func check(_ str : String) -> Bool {

	guard !str.isEmpty else {
		return true
	}
	var start = str.startIndex
	let lastStr = str[start]
	start = str.index(after : start)
	//print(lastStr)
	while start != str.endIndex {
		if str[start] != lastStr {
			return false
		}
		start = str.index(after : start)
	} 
	return true
}

let c = check(str)
print(c)