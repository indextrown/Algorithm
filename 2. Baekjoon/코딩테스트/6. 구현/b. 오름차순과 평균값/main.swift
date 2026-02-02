//
//  2. sort+avg.swift
//  Algorithm
//
//  Created by 김동현 on 2/3/26.
//
/*
 https://clamp-coding.tistory.com/215
 https://leesangdo.tistory.com/249
 */

import Foundation

// 정렬된 배열을 출력하고 배열의 평균값을 출력하라
freopen("input.txt", "r", stdin)
let _ = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let avg = Double(arr.reduce(0, +)) / Double(arr.count)
print(arr.sorted(by: >))
print(String(format: "%.2f", avg))

