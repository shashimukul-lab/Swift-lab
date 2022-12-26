//Remove all characters except the numeric characters from an alphanumeric string.

//let str = "AA1d23cBB4"
let str = "a1b2c3"

func removeCharacters(_ str : String) -> String {
	guard !str.isEmpty else {
		return ""
	}
	var s = ""
	for c in str {
		if c.isNumber {
			s += String(c)
		}
	}
	return s
}

let s = removeCharacters(str)
print(s)