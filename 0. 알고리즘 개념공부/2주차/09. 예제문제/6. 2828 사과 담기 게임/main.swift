//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 5/22/25.
//

/*
 5 1
 3
 1
 5
 3
 */

import Foundation

freopen("input.txt", "r", stdin)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]          // screen
let m = input[1]          // basket
let j = Int(readLine()!)! // count

var left = 1
var right = left + m - 1 // 그냉 m으로 해도 된다
var totalMove = 0

for _ in 0..<j {
    // 사과가 떨어지는 위치
    let pos = Int(readLine()!)!
    
    // 사과의 위치가 이미 바구니가 있는 위치이면 아래 바구니 이동 로직을 무시
    if pos >= left && pos <= right { continue }
   
    // 포지션이 바구니 안에 있으면 이동 안함
    if pos < left {
        let move = left - pos
        left -= move
        right -= move
        totalMove += move
    } else if pos > right {
        let move = pos - right
        right += move
        left += move
        totalMove += move
    }
}

print(totalMove)

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0]          // screen
//let m = input[1]          // basket
//let j = Int(readLine()!)! // count
//
//var left = 1
//var totalMove = 0
//
//for _ in 0..<j {
//    // 사과가 떨어지는 위치
//    let pos = Int(readLine()!)!
//    
//    let right = left + m - 1
//   
//    // 이 로직을 넣으면 아래의 두 조건문을 검사를 하지 않아 상능 향상
//    if pos >= left && pos <= right { continue }
//    
//    // 포지션이 바구니 안에 있으면 이동 안함
//    if pos < left {
//        let move = left - pos
//        left -= move
//        totalMove += move
//    } else if pos > right {
//        let move = pos - right
//        left += move
//        totalMove += move
//    }
//}
//
//print(totalMove)

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0]          // screen
//let m = input[1]          // basket
//let j = Int(readLine()!)! // count
//
//var bucket = (1, m)
//var totalMove = 0
//
//for _ in 0..<j {
//    // 사과가 떨어지는 위치
//    let pos = Int(readLine()!)!
//    
//    // 사과의 위치가 이미 바구니가 있는 위치이면 아래 바구니 이동 로직을 무시
//    if pos >= bucket.0 && pos <= bucket.1 { continue }
//   
//    // 포지션이 바구니 안에 있으면 이동 안함
//    if pos < bucket.0 {
//        let move = bucket.0 - pos
//        bucket.0 -= move
//        bucket.1 -= move
//        totalMove += move
//    } else if pos > bucket.1 {
//        let move = pos - bucket.1
//        bucket.1 += move
//        bucket.0 += move
//        totalMove += move
//    }
//}
//
//print(totalMove)
