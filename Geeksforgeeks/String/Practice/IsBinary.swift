//Given a non-empty sequence of characters str, return true if sequence is Binary, else return false

//let str = "101"
let str = "155"

func isBinary(_ str : String) -> Bool {

	guard !str.isEmpty else {
		return false
	}
	for c in str {
		if c != "0" && c != "1" {
			return false	
		}
	}
	return true
}

let b = isBinary(str)
print(b)