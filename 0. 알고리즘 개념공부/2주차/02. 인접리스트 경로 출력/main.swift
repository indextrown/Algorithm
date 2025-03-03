//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/11/25.
//

let v: Int = 4
var adj: [[Int]] = Array(repeating: [], count: v)

adj[0].append(1)
adj[0].append(2)
adj[0].append(3)

adj[1].append(0)
adj[1].append(2)

adj[2].append(0)
adj[2].append(1)

adj[3].append(0)

// 1번방식
for i in 0..<v {
    print(i, ": ", terminator: "")
    for j in 0..<adj[i].count {
        print(adj[i][j], terminator: " ")
    }
    print()
}

// 2번방식
for i in 0..<v {
    print(i, ": ", terminator: "")
    for there in adj[i] {
        print(there, terminator: " ")
    }
    print()
}

/*
 0 : 1 2 3
 1 : 0 2
 2 : 0 1
 3 : 0
 */
