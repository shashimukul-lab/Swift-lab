// Given a 2D array, print it in spiral form. 

var a = [   
			[1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 10, 11, 12],
            [13, 14, 15, 16]
       ]
// var a = [   
// 			[1, 2, 3, 4]
//             //[5, 6, 7, 8]
//         ]

// var a = [
// 			[1],
// 			[2],
// 			[3],
// 			[4]
// 		]

// var a = [
// 			[1, 2, 3],
// 			[4, 5, 6],
// 			[7, 8, 9]
// 		]

//Method 1
// func spiralPrint(_ a : [[Int]]) {
// 	var k = 0, l = 0
// 	var m = a.count
// 	var n = 0
// 	if let first = a.first {
// 		n = first.count
// 	}
// 	while(k < m && l < n) {
// 		for i in l..<n {
// 			print(a[k][i], terminator : " ")
// 		}
// 		k = k + 1
// 		for i in k..<m {
// 			print(a[i][n - 1], terminator : " ")
// 		}
// 		n = n - 1
// 		if k < m {
// 			for i in (l..<n).reversed() {
// 				print(a[m - 1][i], terminator : " ")
// 			}
// 			m = m - 1
// 		}
// 		if l < n {
// 			for i in (k..<m).reversed() {
// 				print(a[i][l], terminator : " ")
// 			}
// 			l = l + 1
// 		}
// 	}  
// 	//print(m, n)
// }

//Method 2
// func spiralPrint(_ a : [[Int]], _ i : Int, _ j : Int, _ m : Int, _ n : Int) {
// 	if i >= m || j >= n {
// 		return
// 	}
// 	for index in j..<n {
// 		print(a[i][index], terminator : " ")
// 	}
// 	for index in i + 1..<m {
// 		print(a[index][n - 1], terminator : " ")
// 	}
// 	if (m - 1) != i {
// 		for index in (j..<n - 1).reversed() {
// 			print(a[m - 1][index], terminator : " ")
// 		}
// 	}
// 	if (n - 1) != j {
// 		var p = m - 2
// 		while(p > i) {
// 			print(a[p][j], terminator : " ")
// 			p -= 1
// 		}
// 		// for index in (i + 1..<m - 1).reversed() {
// 		// 	print(a[index][j], terminator : " ")
// 		// }
// 	}
// 	spiralPrint(a, i + 1, j + 1, m - 1, n - 1)
// }


//Method 3
// func isInBounds(_ i : Int, _ j : Int, _ m : Int, _ n : Int) -> Bool {
// 	if (i < 0 || i >= m) || (j < 0 || j >= n) {
// 		return false
// 	}
// 	return true
// }

// func isBlocked(_ matrix : [[Int]], _ i : Int, _ j : Int) -> Bool {
// 	let m = matrix.count
// 	var n = 0
// 	if let first = matrix.first {
// 		n = first.count
// 	}
// 	if !isInBounds(i, j, m, n) || matrix[i][j] == -1 {
// 		return true
// 	}
// 	return false
// }

// func spirallyDFSTravserse(_ matrix : inout [[Int]], _ i : Int, _ j : Int, _ dir : Int, _ res : inout [Int]) {
// 	if isBlocked(matrix, i, j) {
// 		return
// 	}
// 	var allBlocked = true
// 	for k in stride(from : -1, through : 1, by : 2) {
// 		allBlocked = allBlocked && isBlocked(matrix, k + i, j) && isBlocked(matrix, i, j + k)
// 	}
// 	res.append(matrix[i][j])
// 	matrix[i][j] = -1
// 	if allBlocked {
// 		return
// 	}
// 	//dir : 0 - right, 1 - down, 2 - left, 3 - up
// 	var next_i = i
// 	var next_j = j
// 	var next_dir = dir
// 	if dir == 0 {
// 		if !isBlocked(matrix, i, j + 1) {
// 			next_j += 1
// 		} else {
// 			next_i += 1
// 			next_dir = 1
// 		}
// 	} else if dir == 1 {
// 		if !isBlocked(matrix, i + 1, j) {
// 			next_i += 1
// 		} else {
// 			next_j -= 1
// 			next_dir = 2
// 		}
// 	} else if dir == 2 {
// 		if !isBlocked(matrix, i, j - 1) {
// 			next_j -= 1
// 		} else {
// 			next_i -= 1
// 			next_dir = 3
// 		}
// 	} else if dir == 3 {
// 		if !isBlocked(matrix, i - 1, j) {
// 			next_i -= 1
// 		} else {
// 			next_j += 1
// 			next_dir = 0
// 		}
// 	} 
// 	spirallyDFSTravserse(&matrix, next_i, next_j, next_dir, &res)
// }

//Method 4
func spiralOrder(_ matrix : [[Int]]) -> [Int] {
	guard !matrix.isEmpty else {
		return []
	}
	let m = matrix.count
	var n = 0
	if let first = matrix.first {
		n = first.count
	}
	var res = [Int]()
	var seen = Array(repeating : Array(repeating : false, count : n), count : m)
	let dr = [0, 1, 0, -1]
	let dc = [1, 0, -1, 0]
	var x = 0, y = 0, di = 0
	for _ in 0..<m * n {
		res.append(matrix[x][y])
		seen[x][y] = true
		let newX = x + dr[di]
		let newY = y + dc[di]
		if (0 <= newX && newX < m && 0 <= newY && newY < n && !seen[newX][newY]) {
			x = newX
			y = newY
		} else {
			di = (di + 1) % 4
			x += dr[di]
			y += dc[di]
		}
	}
	return res
}


//var n = 0
//if let first = a.first {
//	n = first.count
//}
//spiralPrint(a, 0, 0, a.count, n)
//print("")
//var result = [Int]()
//spirallyDFSTravserse(&a, 0, 0, 0, &result)
//print(result)
let result = spiralOrder(a)
print(result) 