//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 5/15/25.
//
// https://www.acmicpc.net/problem/2178
// https://didu-story.tistory.com/177

import Foundation

freopen("input.txt", "r", stdin)

let max_n = 104
let dy = [-1, 0, 1, 0]
let dx = [0, 1, 0, -1]
var maze: [[Int]] = []
var visited = Array(repeating: Array(repeating: 0, count: max_n), count: max_n)
var q: [(Int, Int)] = []

// (세로, 가로)
let (n, m): (Int, Int) = { let input = readLine()!.split(separator: " ").map { Int($0)! }; return (input[0], input[1]) }()

for _ in 0..<n {
    let row = Array(readLine()!).map { Int(String($0))! }
    maze.append(row)
}

visited[0][0] = 1   // 1. 방문처리를 하고
q.append((0, 0))    // 2. push

while !q.isEmpty {
    let (y, x) = q.removeFirst()
    
    for i in 0..<4 {
        
        let ny = y + dy[i]
        let nx = x + dx[i]
        
        // 범위 체크
        if ny<0 || ny>=n || nx<0 || nx>=m { continue }
        
        // 벽이거나 이미 방문한 경우 무시
        if maze[ny][nx] == 0 || visited[ny][nx] > 0 { continue }
        
        visited[ny][nx] = visited[y][x] + 1
        
        q.append((ny, nx))
    }
}

print(visited[n-1][m-1])





//import Foundation
//
//freopen("input.txt", "r", stdin)
//
//struct Queue<T> {
//    // 모든 큐 요소를 저장하는 배열
//    // dequeue 시 실제로 요소를 제거하지 않고 인덱스만 증가시키는 방식을 사용
//    var memory: [T] = []
//    
//    // 큐의 현재 위치를 가리키는 인덱스
//    // dequeue 연산을 수행할 때 이 인덱스의 값이 증가함
//    var index = 0
//    
//    // 새로운 요소를 큐의 끝에 추가하는 함수 (enqueue 연산)
//    // - memory 배열의 끝에 새 요소를 추가함
//    // - 시간 복잡도: O(1) (평균적으로, 때로는 재할당 때문에 O(n)이 될 수 있음)
//    var isEmpty: Bool {
//        memory.count < index + 1
//    }
//    
//    // 새로운 요소를 큐의 끝에 추가하는 함수 (enqueue 연산)
//    // - memory 배열의 끝에 새 요소를 추가함
//    // - 시간 복잡도: O(1) (평균적으로, 때로는 재할당 때문에 O(n)이 될 수 있음)
//    mutating func enqueue(_ element: T) {
//        memory.append(element)
//    }
//    
//    // 큐의 앞에서 요소를 제거하고 반환하는 함수 (dequeue 연산)
//   // - 실제로 요소를 제거하지 않고 인덱스만 증가시켜 효율적으로 구현
//   // - 시간 복잡도: O(1)
//   // - 주의: isEmpty 확인 없이 호출하면 인덱스가 범위를 벗어나 오류가 발생할 수 있음
//    mutating func dequeue() -> T {
//        let v = memory[index]
//        index += 1
//        return v
//    }
//}
//
//let max_n = 104
//let dy = [-1, 0, 1, 0]
//let dx = [0, 1, 0, -1]
//var maze = Array(repeating: Array(repeating: 0, count: max_n), count: max_n)
//var visited = Array(repeating: Array(repeating: 0, count: max_n), count: max_n)
//
//// (세로, 가로)
//let (n, m): (Int, Int) = { let input = readLine()!.split(separator: " ").map { Int($0)! }; return (input[0], input[1]) }()
//
//for i in 0..<n {
//    let row = Array(readLine()!).map { Int(String($0))! }
//    for j in 0..<m {
//        maze[i][j] = row[j]
//    }
//}
//
//var q = Queue<(y: Int, x: Int)>()
//visited[0][0] = 1 // 1. 방문처리를 하고
//q.enqueue((0, 0))    // 2. push
//
//while !q.isEmpty {
//    let (y, x) = q.dequeue()
//    
//    for i in 0..<4 {
//        
//        let ny = y + dy[i]
//        let nx = x + dx[i]
//        
//        // 범위 체크
//        if ny<0 || ny>=n || nx<0 || nx>=m { continue }
//        
//        // 벽이거나 이미 방문한 경우 무시
//        if maze[ny][nx] == 0 || visited[ny][nx] > 0 { continue }
//        
//        visited[ny][nx] = visited[y][x] + 1
//        
//        q.enqueue((ny, nx))
//    }
//}
//
//print(visited[n-1][m-1])




//let input = readLine()!.split(separator:" ").map { Int($0)! }
//let (n, m) = (input[0], input[1])
//var board:[[Int]] = []
//var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
//let dx = [-1, 1, 0, 0]
//let dy = [0, 0, -1, 1]
//var nx = 0, ny = 0
//
//for _ in 0..<n {
//  board.append(readLine()!.map { Int(String($0))! })
//}
//
//var q = [(0, 0)]
//visited[0][0] = 1
//
//while !q.isEmpty {
//  let (x, y) = q.removeFirst()
//
//  for i in 0..<4 {
//    nx = x + dx[i]
//    ny = y + dy[i]
//
//    guard 0 <= nx, nx < n, 0 <= ny, ny < m, visited[nx][ny] == 0, board[nx][ny] == 1 else { continue }
//
//    visited[nx][ny] = visited[x][y] + 1
//    q.append((nx, ny))
//  }
//}
//
//print(visited[n-1][m-1])




//import Foundation
//
//freopen("input.txt", "r", stdin)
//
//let max_n = 104
//let dy = [-1, 0, 1, 0]
//let dx = [0, 1, 0, -1]
//var maze = Array(repeating: Array(repeating: 0, count: max_n), count: max_n)
//var visited = Array(repeating: Array(repeating: 0, count: max_n), count: max_n)
//var q: [(Int, Int)] = []
//
//// (세로, 가로)
//let (n, m): (Int, Int) = { let input = readLine()!.split(separator: " ").map { Int($0)! }; return (input[0], input[1]) }()
//
//for i in 0..<n {
//    let row = Array(readLine()!).map { Int(String($0))! }
//    for j in 0..<m {
//        maze[i][j] = row[j]
//    }
//}
//
//visited[0][0] = 1   // 1. 방문처리를 하고
//q.append((0, 0))    // 2. push
//
//while !q.isEmpty {
//    let (y, x) = q.removeFirst()
//    
//    for i in 0..<4 {
//        
//        let ny = y + dy[i]
//        let nx = x + dx[i]
//        
//        // 범위 체크
//        if ny<0 || ny>=n || nx<0 || nx>=m { continue }
//        
//        // 벽이거나 이미 방문한 경우 무시
//        if maze[ny][nx] == 0 || visited[ny][nx] > 0 { continue }
//        
//        visited[ny][nx] = visited[y][x] + 1
//        
//        q.append((ny, nx))
//    }
//}
//
//print(visited[n-1][m-1])
