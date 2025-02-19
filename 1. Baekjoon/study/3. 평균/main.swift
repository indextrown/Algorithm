//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/2/24.
//
// https://www.acmicpc.net/problem/1546

import Foundation

freopen("input.txt", "r", stdin)

let n = Double(readLine()!)!
var scores = readLine()!.split(separator: " ").map { Double($0)! }
let maxScore = scores.max()
scores = scores.map { $0/maxScore!*100 }

//for i in 0..<scores.count {
//    scores[i] = scores[i]/maxScore!*100
//}

let result = scores.reduce(0) { $0+$1 }
print(result/n)


