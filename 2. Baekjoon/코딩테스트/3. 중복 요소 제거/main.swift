//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 2/2/26.
//

import Foundation

// 중복된 요소 제거하기
var arr: [Int] = [2, 2, 1, 1, 3, 3, 2, 2]

// 1. 딕셔너리(비효율)
var dic: [Int: Int] = [:]
for i in arr {
    if dic[i] == nil {
        dic[i, default: 0] += 1
    }
}
dic.keys.sorted().forEach { print($0) }

// 2. set 사용
//var sett: Set<Int> = []
//arr.forEach { sett.insert($0) }
//sett.sorted().forEach { print($0) }
var result = Set(arr).sorted()
result.forEach { print($0) }
