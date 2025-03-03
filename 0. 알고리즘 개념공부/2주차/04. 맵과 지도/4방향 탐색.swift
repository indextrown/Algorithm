//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/15/25.
//

let n: Int = 3
let dy: [Int] = [-1, 0, 1, 0]
let dx: [Int] = [0, 1, 0, -1]

let y: Int = 0
let x: Int = 0

// 4방향 탐색
for i in 0..<4 {
    let ny = y + dy[i]
    let nx = x + dx[i]
    print("\(ny) : \(nx)")
}
