//Given a string S, write a program to count the occurrence of Lowercase characters, Uppercase characters, 
//Special characters and Numeric values in the string.
//Note: There are no white spaces in the string.

import Foundation
//let str = "#GeeKs01fOr@gEEks07"
let str = "*GeEkS4GeEkS*"

func count(_ str : String) -> [Int] {
	guard !str.isEmpty else {
		return []
	}
	var res = Array(repeating : 0, count : 4)
	let cset = CharacterSet.alphanumerics.inverted
	for c in str {
		if c.isUppercase {
			res[0] += 1
		} else if c.isLowercase {
			res[1] += 1
		} else if c.isNumber {
			res[2] += 1
		} else if String(c).rangeOfCharacter(from : cset) != nil {
			res[3] += 1
		}
	}
	return res
}

let c = count(str)
print(c)
