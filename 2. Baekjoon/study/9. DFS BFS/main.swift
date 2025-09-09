//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 9/8/25.
//

//import Foundation
//freopen("input.txt", "r", stdin)
//
///*
// n: 정점개수
// m: 간선개수
// v: 탐색시작점
// */
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m, v) = (input[0], input[1], input[2])
//
//var adj: [[Int]] = Array(repeating: [], count: n + 1) // +1 해주는 이유는 정점이 1번부터 시작
//var visited: [Bool] = Array(repeating: false, count: n + 1)
//
//for _ in 0..<m {
//    let edge = readLine()!.split(separator: " ").map { Int($0)! }
//    let (start, end) = (edge[0], edge[1])
//    adj[start].append(end)
//    adj[end].append(start)
//}
//
//for i in 1..<n+1 {
//    adj[i].sort()
//}
//
//func dfs(_ here: Int) {
//    visited[here] = true
//    print(here, terminator: " ")
//    for there in adj[here] {
//        if visited[there] { continue }
//        dfs(there)
//    }
//}
//
//func bfs(_ start: Int) {
//    var queue: [Int] = []
//    visited[start] = true
//    queue.append(start)
//    
//    while !queue.isEmpty {
//        let first = queue.removeFirst()
//        print(first, terminator: " ")
//        for there in adj[first] {
//            if visited[there] { continue }
//            visited[there] = true
//            queue.append(there)
//        }
//    }
//}
//
//dfs(v)
//print()
//visited = Array(repeating: false, count: n + 1)
//bfs(v)
//










//
//
//
//import Foundation
//freopen("input.txt", "r", stdin)
//
///*
// n: 정점개수
// m: 간선개수
// v: 탐색시작점
// */
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m, v) = (input[0], input[1], input[2])
//var adj: [[Int]] = Array(repeating: [], count: n + 1) // +1 해주는 이유는 정점이 1번부터 시작
//var visitedDFS: [Bool] = Array(repeating: false, count: n + 1)
//var visitedBFS: [Bool] = Array(repeating: false, count: n + 1)
//var resultDFS: [Int] = []
//var resultBFS: [Int] = []
//
//func dfs(_ here: Int) {
//    visitedDFS[here] = true
//    resultDFS.append(here)
//    for there in adj[here] {
//        if visitedDFS[there] { continue }
//        dfs(there)
//    }
//}
//
//func bfs(_ start: Int) {
//    var queue: [Int] = []
//    visitedBFS[start] = true
//    queue.append(start)
//    
//    while !queue.isEmpty {
//        let first = queue.removeFirst()
//        resultBFS.append(first)
//        for there in adj[first] {
//            if visitedBFS[there] { continue }
//            visitedBFS[there] = true
//            queue.append(there)
//        }
//    }
//}
//
//for _ in 0..<m {
//    let edge = readLine()!.split(separator: " ").map { Int($0)! }
//    let (start, end) = (edge[0], edge[1])
//    adj[start].append(end)
//    adj[end].append(start)
//}
//
//for i in 1..<n+1 {
//    adj[i].sort()
//}
//
//dfs(v)
//bfs(v)
//print(resultDFS.map { String($0) }.joined(separator: " "))
//print(resultBFS.map { String($0) }.joined(separator: " "))



import Foundation
freopen("input.txt", "r", stdin)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, v) = (input[0], input[1], input[2])
var adj: [[Int]] = Array(repeating: [], count: n + 1)
var visitedDFS: [Bool] = Array(repeating: false, count: n + 1)
var visitedBFS: [Bool] = Array(repeating: false, count: n + 1)
var resultDFS: [Int] = []
var resultBFS: [Int] = []

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end) = (edge[0], edge[1])
    adj[start].append(end)
    adj[end].append(start)
}

func dfs(_ start: Int) {
    visitedDFS[start] = true
    resultDFS.append(start)
    
    for there in adj[start] {
        if visitedDFS[there] { continue }
        dfs(there)
    }
}

func bfs(_ start: Int) {
    var queue: [Int] = []
    visitedBFS[start] = true
    queue.append(start)
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        resultBFS.append(first)
        for there in adj[first] {
            if visitedBFS[there] { continue }
            visitedBFS[there] = true
            queue.append(there)
        }
    }
}

for i in 0..<n+1 {
    adj[i].sort()
}

dfs(v)
bfs(v)
print(resultDFS.map { String($0) }.joined(separator: " "))
print(resultBFS.map { String($0) }.joined(separator: " "))
