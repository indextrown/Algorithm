//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/31/25.
//

/*
 최단 거리를 구할 때는 BFS가 효율적이다
 - Queue를 사용한다
 */

//visited[0][0] = 1
//queue.append((0, 0))
//
//while !queue.isEmpty {
//    let (y, x) = queue.removeFirst()
//    for i in 0..<4 {
//        let ny = y + dy[i]
//        let nx = x + dx[i]
//
//        // 방어 로직
//        if ny < 0 || ny >= n || nx < 0 || nx >= m { continue }
//
//        // 벽이거나 이미 방문한 경우 무시(배열의 마지막 인덱스: n-1, m-1)
//        if graph[ny][nx] == 0 || visited[ny][nx] != 0 { continue }
//
//        visited[ny][nx] = visited[y][x] + 1
//        queue.append((ny, nx))
//    }
//}
//
//// 배열의 마지막 인덱스
//print(visited[n-1][m-1])

import Foundation
freopen("input.txt", "r", stdin)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var graph: [[Int]] = []

for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    graph.append(row)
}

func bfs(startY: Int, startX: Int) -> Int {
    var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
    var queue: [(Int, Int)] = []
    
    // 첫 요소 추가
    visited[startY][startX] = 1
    queue.append((startY, startX))
    
    while !queue.isEmpty {
        let (y, x) = queue.removeFirst()
        for i in 0..<4 {
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if ny < 0 || ny >= n || nx < 0 || nx >= m { continue }

            if graph[ny][nx] == 0 || visited[ny][nx] != 0 { continue }
            
            visited[ny][nx] = visited[y][x] + 1
            queue.append((ny, nx))
        }
    }
    return visited[n-1][m-1]
}

print(bfs(startY: 0, startX: 0))
