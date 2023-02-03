// Given a string. Count the number of Camel Case characters in it.

//let str = "ckjkUUYII"
let str = "abcd"

func countCamelCase(_ str : String) -> Int {
	guard !str.isEmpty else {
		return 0
	}
	var count = 0
	for c in str {
		if c.isUppercase {
			count += 1
		}
	}
	return count
}

let c = countCamelCase(str) 
print(c)