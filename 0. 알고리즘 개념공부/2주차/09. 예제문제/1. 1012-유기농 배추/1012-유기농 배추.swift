////
////  1012-유기농 배추.swift
////  Algorithm
////
////  Created by 김동현 on 4/17/25.
////
//
//import Foundation
//
//@main
//struct Main {
//    static func main() {
//        freopen("input.txt", "r", stdin)
//        
//        let t = readLine()!.split(separator: " ").map { Int($0)! }[0]
//    
//        for _ in 0..<t {
//            // 1. 테스트케이스 시작
//            let input = readLine()!.split(separator: " ").map { Int($0)! }
//            let (m, n, k) = (input[0], input[1], input[2])
//            
//            // 2. 배추밭, 방문배열
//            var a: [[Bool]] = Array(repeating: Array(repeating: false, count: 50), count: 50)
//            var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 50), count: 50)
//            
//            
//            
//            for _ in 0..<k {
//                let (x, y) = { let a = readLine()!.split(separator: " ").map { Int($0)! }; return (a[0], a[1]) }()
//                a[x][y] = true
//                // print("\(x), \(y)")
//            }
//            print()
//        }
//    }
//}
