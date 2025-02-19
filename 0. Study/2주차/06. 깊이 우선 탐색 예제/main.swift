//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 2/16/25.
//

/*
 MARK: [connected component 문제] - 종화는 방구쟁이야
 
 종화는 21세기 유명한 방구쟁이다. 종화는 방구를 낄 때 "이러다... 다 죽어!!" 를 외치며 방구를
 뀌는데 이렇게 방귀를 뀌었을 때 방귀는 상하좌우 네방향으로 뻗어나가며 종화와 연결된 "육지"는
 모두 다 오염된다.
 "바다"로는 방구가 갈 수 없다. 맵이 주어졌을 때 종화가 "이러다... 다 죽어!!"를
 "최소한" 몇 번외쳐야 모든 육지를 오염시킬 수 있는지 말해보자. 1은 육지며 0은 바다를 가리킨다.
 
 입력
 맵의 세로길이 N과 가로길이 M 이 주어지고 이어서 N * M의 맵이 주어진다.
 
 출력
 "이러다... 다 죽어!!"를 몇 번 외쳐야하는지 출력하라.
 
 범위
 1 <= N <= 100
 1 <= M <= 100
 
 예제입력
 5 5
 1 0 1 0 1
 1 1 0 0 1
 0 0 0 1 1
 0 0 0 1 1
 0 1 0 0 0
 
 예제출력
 4
 
 */

import Foundation

freopen("input.txt", "r", stdin);
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var adj: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var ny = 0, nx = 0, ret = 0

func DFS(_ y: Int, _ x: Int) {
    visited[y][x] = true
    
    for i in 0..<4 {
        ny = y + dy[i]
        nx = x + dx[i]
        
        if ny < 0 || nx < 0 || ny >= n || nx >= m { continue }
        
        if !visited[ny][nx] && adj[ny][nx] == 1 {
            DFS(ny, nx)
        }
    }
}

for row in 0..<n {
    let data = readLine()!.split(separator: " ").map { Int($0)! }
    adj[row] = data
}

for row in 0..<n {
    for col in 0..<m {
        if !visited[row][col] && adj[row][col] == 1{
            DFS(row, col)
            ret += 1
        }
    }
}

print(ret)
