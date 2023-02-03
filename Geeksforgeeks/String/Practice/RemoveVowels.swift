// Given a string, remove the vowels from the string.

//let str = "welcome to geeksforgeeks"
let str = "what is your name ?"

func removeVowels(_ str : String) -> String {
	guard !str.isEmpty else {
		return ""
	}
	let vowels : [Character] = ["a", "e", "i", "o", "u"]
	var res = ""
	for c in str {
		if !vowels.contains(c) {
			res = res + String(c)
		}
	}
	return res
}

let res = removeVowels(str)
print(res)