//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 9/9/25.
//

import Foundation
freopen("input.txt", "r", stdin)

func readPair() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

let (n, m) = readPair()
let (sy, sx) = readPair()
let (ey, ex) = readPair()
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var graph: [[Int]] = []
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(row)
}

func bfs(sy: Int, sx: Int) -> Int {
    var queue: [(Int, Int)] = []
    visited[sy][sx] = 1
    queue.append((sy, sx))
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        
        if y == ey && x == ex {
            return visited[y][x]
        }
        
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny<0 || ny>=n || nx<0 || nx>=m { continue }
            
            // 벽이거나 한번 방문했으면 무시
            if graph[ny][nx] == 0 || visited[ny][nx] != 0 { continue }
            visited[ny][nx] = visited[y][x] + 1
            queue.append((ny, nx))
        }
    }
    
    return -1
}

print(bfs(sy: sy, sx: sx))
