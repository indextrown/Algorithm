//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/11/25.
//

//let v = 10
//var adj: [[Int]] = Array(repeating: [], count: v)
//var visited: [Bool] = Array(repeating: false, count: v)
//
//func go(_ from: Int) {
//    visited[from] = true
//    print(from)
//    
//    for there in adj[from] {
//        if !visited[there] {
//            go(there)
//        }
//    }
//}
//
//adj[1].append(2);
//adj[2].append(1);
//
//adj[1].append(3);
//adj[3].append(1);
//
//adj[3].append(4);
//adj[4].append(3);
//
//
//for i in 0..<v {
//    // 방문하지 않고 연결된 간선이 있는 경우 DFS 시작
//    // !adj[i].isEmpty를 통해 고립된 노드는 건너뛴다
//    if !visited[i] && !adj[i].isEmpty {
//        go(i)
//    }
//}

let v = 10
var adjList: [[Int]] = Array(repeating: [], count: v)
var visited: [Bool] = Array(repeating: false, count: v)

func go(_ from: Int) {
    visited[from] = true
    print(from)
    
    
    
    // 1번방식: C++ 스타일
    /*
    for i in 0..<adjList[from].count {
        let there = adjList[from][i]
        if !visited[there] {
            go(there)
        }
    }
     */
    
    // 2번방식
    for there in adjList[from] {
        if !visited[there] {
            go(there)
        }
    }
}

adjList[1].append(2);
adjList[2].append(1);

adjList[1].append(3);
adjList[3].append(1);

adjList[3].append(4);
adjList[4].append(3);

for i in 0..<v {
    if !visited[i] && adjList[i].count != 0 {
        go(i)
    }
}
