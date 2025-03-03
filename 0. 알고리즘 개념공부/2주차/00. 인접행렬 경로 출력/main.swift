//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/7/25.
//

import Foundation

let n = 4

let arr: [[Int]] = [
    [0, 1, 1, 1],
    [1, 0, 1, 0],
    [1, 1, 0, 0],
    [1, 0, 0, 0]
]

for i in 0..<n {
    for j in 0..<n {
        if arr[i][j] != 0 {
            print("\(i)부터 \(j)까지 경로가 있습니다")
        }
    }
}

let arr2: [[Int]] = [
    [0, 1, 0],
    [0, 0, 1],
    [0, 0, 0]
]
