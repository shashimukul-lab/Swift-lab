//Rotate a matrix clockwise

// var a = [
// 			[1, 2, 3, 4],
//         	[5, 6, 7, 8],
//         	[9, 10, 11, 12],
//         	[13, 14, 15, 16]
// 		]

// var a = [
// 			[1, 2, 3, 4]
//         	// [5, 6, 7, 8],
//         	// [9, 10, 11, 12],
//         	// [13, 14, 15, 16]
// 		]

var a = [
			[1, 2, 3],
        	[4, 5, 6],
        	[7, 8, 9]
		]

func rotatematrix(_ matrix : inout [[Int]]) {
	guard !matrix.isEmpty else {
		return
	}
	var m = matrix.count
	var n = 0
	if let first = matrix.first {
		n = first.count
	}
	var row = 0, col = 0
	var prev = 0, curr = 0
	while(row < m && col < n) {
		if row + 1 == m || col + 1 == n {
			break
		}
		prev = matrix[row + 1][col]
		for i in col..<n {
			curr = matrix[row][i]
			matrix[row][i] = prev
			prev = curr
		}
		row += 1
		for i in row..<m {
			curr = matrix[i][n - 1]
			matrix[i][n - 1] = prev
			prev = curr
		}
		n -= 1
		if row < m {
			for i in (col..<n).reversed() {
				curr = matrix[m - 1][i]
				matrix[m - 1][i] = prev
				prev = curr
			}

		}
		m -= 1
		if col < n {
			for i in (row..<m).reversed() {
				curr = matrix[i][col]
				matrix[i][col] = prev
				prev = curr
			}
			col += 1
		} 
	}
	print(matrix)
}

rotatematrix(&a)