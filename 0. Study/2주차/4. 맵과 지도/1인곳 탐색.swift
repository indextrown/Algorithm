//
//  main2.swift
//  Algorithm
//
//  Created by 김동현 on 1/15/25.
//

import Foundation

/*
 - 왼쪽 상단부터 시작(0, 0은 무조건 1임을 보장)
 - 4방향 탐색 가능, 방문한 정점은 다시 방문하지 않는다   -> dydx, visited
 - 정점을 다 방문하면서(1인 곳만 갈 수 있음 )
 - 방문한 정점 출력
 
   1 0 1
   1 0 1
   0 1 1
 */

// 상수
let n: Int = 3
let dy: [Int] = [-1, 0, 1, 0]
let dx: [Int] = [0, 1, 0, -1]

// 입력 데이터와 방문 배열
var a: [[Int]] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)

func go(_ y: Int, _ x: Int) {
    visited[y][x] = true
    print("\(y) : \(x)")
    for i in 0..<4 {
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        if ny<0 || ny>=n || nx<0 || nx>=n { continue }
        if a[ny][nx] == 0 { continue }
        if visited[ny][nx] { continue }
        go(ny, nx)
    }
}

@main
struct Main {
    static func main() {
        freopen("input.txt", "r", stdin);
        for _ in 0..<n {
            let line = readLine()!.split(separator: " ").map { Int($0)! }
            a.append(line)
        }
        go(0, 0)
    }
}
