//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 4/17/25.
//
// https://dev-mandos.tistory.com/5

import Foundation

freopen("input.txt", "r", stdin)

let t = readLine()!.split(separator: " ").map { Int($0)! }[0]
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var ny, nx: Int
var ret: Int = 0

for _ in 0..<t {
    ret = 0
    // (y, x, cnt)
    let (m, n, k): (Int, Int, Int) = { let input = readLine()!.split(separator: " ").map { Int($0)! }; return (input[0], input[1], input[2]) }()
    var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    func dfs(_ y: Int, _ x: Int) {
        visited[y][x] = true
        for i in 0..<4 {
            ny = y + dy[i]
            nx = x + dx[i]
            if (ny<0 || ny>=n || nx<0 || nx>=m) {continue}
            if (graph[ny][nx] == 1 && !visited[ny][nx]) {dfs(ny, nx)}
        }
        return
    }
    
    for _ in 0..<k {
        let (x, y): (Int, Int) = { let input = readLine()!.split(separator: " ").map { Int($0)! }; return (input[0], input[1])}()
        graph[y][x] = 1
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 1 && !visited[i][j] {
                ret+=1
                dfs(i, j)
            }
        }
    }
    print(ret)
}
