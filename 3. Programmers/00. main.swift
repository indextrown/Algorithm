//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/7/25.
//

import Foundation

/*
 // MARK: - 풀이
 xor
 - 같으면 0
 - 다르면 1
 */
let arr = [1, 1, 2, 9, 2, 3, 3]

// MARK: - Swift Style
print(arr.reduce(0, ^))

// MARK: - C Style
var result = 0
arr.forEach { num in
    result ^= num
}
print(result)
