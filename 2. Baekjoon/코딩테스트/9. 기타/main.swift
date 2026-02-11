/*
0: 전류 잘 통하는 흰색
1. 전류 안 통하는 검은색
*/

import Foundation

freopen("input.txt", "r", stdin)

let dy = [0, 1, 0, -1]
let dx = [-1, 0, 1, 0]
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (input[0], input[1])
var matrix: [[Int]] = []
var visited = Array(repeating: Array(repeating: false, count: n), count: m)
var finish = false

for _ in 0..<m {
    let input = readLine()!.map { Int(String($0))! }
    matrix.append(input)
}

func dfs(_ row: Int, _ col: Int) {
    visited[row][col] = true

    // 기저사례
    if row == m - 1 {
        finish = true
        return
    }

    for i in 0..<4 {
        let ny = row + dy[i]
        let nx = col + dx[i]

        if ny >= 0 && ny < m && 
        nx >= 0 && nx < n &&
        !visited[ny][nx] && matrix[ny][nx] == 0 {
            dfs(ny, nx)
        }
    }
}

for col in 0..<n {
    if matrix[0][col] == 0 && !visited[0][col] {
        dfs(0, col)
    }
}

print(finish ? "YES" : "NO")
