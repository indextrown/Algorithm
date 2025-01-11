//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/10/25.
//

let v: Int = 10
var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 10)
var visited: [Bool] = Array(repeating: false, count: 10)

let edges = [
    (1, 2), (2, 1),
    (1, 3), (3, 1),
    (3, 4), (4, 3)
]

for (u, v) in edges {
    arr[u][v] = 1
    arr[v][u] = 1
}

// 깊이 우선
func go(_ from: Int) {
    visited[from] = true
    print(from)
    
    for i in 0..<v {
        if !visited[i] && arr[from][i] == 1 {
            go(i)
        }
    }
}

for i in 0..<v {
    for j in 0..<v {
        if (!visited[i] && arr[i][j] == 1) {
            // 함수
            go(i)
        }
    }
}

