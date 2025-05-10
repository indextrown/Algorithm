//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 5/2/25.
//
// https://www.acmicpc.net/problem/2583

/*
 m x n(m세로, n가로 <= 100)
 직사각형 - k개 
 */

import Foundation

freopen("input.txt", "r", stdin)

let (m, n, k): (Int, Int, Int) = { let input = readLine()!.split(separator: " ").map { Int($0)! }; return (input[0], input[1], input[2]) }()
var graph = Array(repeating: Array(repeating: false, count: n), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)

let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var ret = 0
var arr: [Int] = []


func dfs(_ y: Int, _ x: Int) -> Int {
    visited[y][x] = true
    
    var area = 1
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny<0 || ny>=m || nx<0 || nx>=n { continue }
        if !visited[ny][nx] && graph[ny][nx] == false {
            area += dfs(ny, nx)
        }
    }
    return area
}

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (lx, ly) = (input[0], input[1])
    let (rx, ry) = (input[2], input[3])
    
    for y in ly..<ry {
        for x in lx..<rx {
            graph[y][x] = true
        }
    }
}

for i in 0..<m {
    for j in 0..<n {
        if graph[i][j] == false && !visited[i][j] {
            ret+=1
            let area = dfs(i,j)
            arr.append(area)
        }
    }
}

print(ret)
print(arr.sorted().map { String($0) }.joined(separator: " "))
