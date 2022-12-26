// Given a list of characters, merge all of them into a string.

let arr : [Character] = ["g", "e", "e", "k", "s", "f", "o", "r", "g", "e", "e", "k", "s"]

func charToStr(_ arr : [Character]) -> String {
	guard !arr.isEmpty else {
		return ""
	}
	var str = ""
	for c in arr {
		str += String(c)
	}
	return str
}

let s = charToStr(arr)
print(s)