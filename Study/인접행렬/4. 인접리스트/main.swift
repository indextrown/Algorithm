//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/11/25.
//

let v = 10
var adj: [[Int]] = Array(repeating: [], count: v)
var visited: [Bool] = Array(repeating: false, count: v)

func go(_ from: Int) {
    visited[from] = true
    print(from)
    
    for there in adj[from] {
        if !visited[there] {
            go(there)
        }
    }
}

adj[1].append(2);
adj[2].append(1);

adj[1].append(3);
adj[3].append(1);

adj[3].append(4);
adj[4].append(3);


for i in 0..<v {
    if !visited[i] && !adj[i].isEmpty {
        go(i)
    }
}
