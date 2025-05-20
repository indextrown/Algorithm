//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 5/20/25.
//
// https://www.acmicpc.net/problem/1992

import Foundation

freopen("input.txt", "r", stdin)

// input
let n = Int(readLine()!)!
var graph: [[String]] = []

for _ in 0..<n {
    let input = readLine()!
    let row = Array(input).map { String($0) }
    graph.append(row)
}

func go(_ y: Int, _ x: Int, _ size: Int) -> String {
    if size == 1 { return graph[y][x] }
    let base = graph[y][x]
    var ret = ""
    
    for row in y..<y+size {
        for col in x..<x+size {
            if base != graph[row][col] {
                ret += "("
                ret += go(y, x, size/2)
                ret += go(y, x+size / 2, size/2)
                ret += go(y+size/2, x, size/2)
                ret += go(y+size/2, x+size/2, size/2)
                ret += ")"
                return ret
            }
        }
    }
    
    return base
}

print(go(0, 0, n))
