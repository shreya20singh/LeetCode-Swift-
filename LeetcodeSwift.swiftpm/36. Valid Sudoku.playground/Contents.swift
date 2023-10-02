/*36. Valid Sudoku - Medium
Topics
Companies
Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

Each row must contain the digits 1-9 without repetition.
Each column must contain the digits 1-9 without repetition.
Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
Note:

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.*/

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9) // To store digits in each row
        var columns = Array(repeating: Set<Character>(), count: 9) // To store digits in each column
        var boxes = Array(repeating: Set<Character>(), count: 9) // To store digits in each 3x3 sub-box
        
        for i in 0..<9 {
            for j in 0..<9 {
                let char = board[i][j]
                
                // Skip empty cells
                if char == "." {
                    continue
                }
                
                // Check row
                if rows[i].contains(char) {
                    return false
                }
                rows[i].insert(char)
                
                // Check column
                if columns[j].contains(char) {
                    return false
                }
                columns[j].insert(char)
                
                // Check 3x3 sub-box
                let boxIndex = (i / 3) * 3 + j / 3
                if boxes[boxIndex].contains(char) {
                    return false
                }
                boxes[boxIndex].insert(char)
            }
        }
        
        return true
    }

}

