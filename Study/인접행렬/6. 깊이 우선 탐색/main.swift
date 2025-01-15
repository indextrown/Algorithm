//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/15/25.
//

let n: Int = 6
var adj: [[Int]] = Array(repeating: [Int](), count: n)
var visited: [Bool] = Array(repeating: false, count: n)

func dfs(_ here: Int) {
    visited[here] = true
    print(here)
    
    for there in adj[here] {
        if visited[there] { continue }
        dfs(there)
    }
}

adj[1].append(2)
adj[1].append(3)
adj[2].append(4)
adj[4].append(2)
adj[2].append(5)
dfs(1)
