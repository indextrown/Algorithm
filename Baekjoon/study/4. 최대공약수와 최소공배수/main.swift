//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/2/24.
//
// https://www.acmicpc.net/problem/2609

import Foundation

freopen("input.txt", "r", stdin)

let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var cd: [Int] = []

// MARK: - 약수
for num in 1...numbers[0] {
    if (numbers[0] % num == 0) && (numbers[1] % num == 0) {
        cd.append(num)
    }
}

// MARK: - 최대공약수
let gcd = cd[cd.indices.last!]




print()
