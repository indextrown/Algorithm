//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/10/25.
//

//let v: Int = 10
//var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 10)
//var visited: [Bool] = Array(repeating: false, count: 10)
//
//let edges = [
//    (1, 2), (2, 1),
//    (1, 3), (3, 1),
//    (3, 4), (4, 3)
//]
//
//for (u, v) in edges {
//    arr[u][v] = 1
//    arr[v][u] = 1
//}
//
//// 깊이 우선
//func go(_ from: Int) {
//    visited[from] = true
//    print(from)
//    
//    for i in 0..<v {
//        if !visited[i] && arr[from][i] == 1 {
//            go(i)
//        }
//    }
//}
//
//for i in 0..<v {
//    for j in 0..<v {
//        if (!visited[i] && arr[i][j] == 1) {
//            // 함수
//            go(i)
//        }
//    }
//}



let v: Int = 10
var adjMatrix: [[Bool]] = Array(repeating: Array(repeating: false, count: v), count: v)
var visited: [Bool] = Array(repeating: false, count: v)

// 재귀함수
func go(_ from: Int) {
    visited[from] = true
    print(from)
    
    for i in 0..<v {
        /*
        1번방식
        만약 방문하였으면 다음루프로
        if visited[i] { continue }
        
        만약 두 정점 사이의 경로가 있다면 탐색
        if adjMatrix[from][i] {
            go(i)
        }
         */
        
        // 2번방식
        if !visited[i] && adjMatrix[from][i] {
            go(i)
        }
    }
}

// 그래프 간선 추가(무방향 그래프)
adjMatrix[1][2] = true; adjMatrix[1][3] = true; adjMatrix[3][4] = true;
adjMatrix[2][1] = true; adjMatrix[3][1] = true; adjMatrix[4][3] = true;

for i in 0..<v {
    for j in 0..<v {
        // 만약 두 정점 사이의 경로가 있고 & 방문하지 않았으면 탐색하자
        if !visited[i] && adjMatrix[i][j] {
            go(i)
        }
    }
}
