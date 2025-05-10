//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 4/27/25.
//

import Foundation

freopen("input.txt", "r", stdin)
let n = readLine()!.split(separator: " ").map { Int($0)! }[0]
var graph = Array(repeating: Array(repeating: 0, count: n), count: n)
var safeGraph = Array(repeating: Array(repeating: 0, count: n), count: n)

var visited = Array(repeating: Array(repeating: false, count: n), count: n)

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var ny = 0, nx = 0, ret = 0
var maxSafeArea = 0

func DFS(_ y: Int, _ x: Int, _ height: Int) {
    visited[y][x] = true
    for i in 0..<4 {
        ny = y + dy[i]
        nx = x + dx[i]
        
        if ny<0 || ny>=n || nx<0 || nx>=n { continue }
        if !visited[ny][nx] && graph[ny][nx] > height {
            DFS(ny, nx, height)
        }
    }
}

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    graph[i] = row
}

for height in 0...100 {
    ret = 0
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && graph[i][j] > height {
                DFS(i, j, height)
                ret += 1
            }
        }
    }
    // ✅ 최댓값 갱신
    if ret > maxSafeArea {
        maxSafeArea = ret
    }
}
print(maxSafeArea)


