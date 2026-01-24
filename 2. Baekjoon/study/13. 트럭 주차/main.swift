//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/25/25.
//
// https://www.acmicpc.net/problem/2979

/*
 트럭 1대: 1분에 A원
 트럭 2대: 1분에 B원
 트럭 3대: 1분에 C원
 
 input: ABC 요금, 주차장에 도착 시간, 주차앙에서 떠난 시간(1~100 사이)
 output: 주차요금
 
 5시간
 2시간
 6시간
 */

//import Foundation
//freopen("input.txt", "r", stdin)
//
//// 주차된 시간을 누적 계산(각 차량마다 주차됨을 기록)
//func calc(_ start: Int, _ end: Int, _ time: inout [Int]) {
//    for i in start..<end {
//        time[i] += 1
//    }
//}
//
//// 요금 계산
//func count(_ start: Int, _ end: Int, _ time: inout [Int]) -> Int {
//    var total = 0
//    
//    for i in 1...100 {
//        switch time[i] {
//        case 1: total += a
//        case 2: total += b * 2
//        case 3: total += c * 3
//        default: break
//        }
//    }
//    return total
//}
//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let (a, b, c) = (input[0], input[1], input[2])
//var time = Array(repeating: 0, count: 101)
//
//for _ in 0..<3 {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let (start, end) = (input[0], input[1])
//    
//    // 해당 구간에 주차됨을 기록
//    calc(start, end, &time)
//}
//print(count(a, b, &time))



import Foundation
freopen("input.txt", "r", stdin)

// 시갼별 주차된 트럭 수
var time = Array(repeating: 0, count: 101)

// 요금 입력
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (input[0], input[1], input[2])

// 트럭 3대 입력
for _ in 0..<3 {
    let t = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end) = (t[0], t[1])
    
    // 해당 시간에 트럭 1대 추가
    for i in start..<end {
        time[i] += 1
    }
}

// 요금 계산
var answer = 0
for i in 1...100 {
    switch time[i] {
    case 1: answer += a
    case 2: answer += b * 2
    case 3: answer += c * 3
    default: break
    }
}
print(answer)

