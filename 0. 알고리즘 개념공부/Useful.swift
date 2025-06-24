//
//  Useful.swift
//  Algorithm
//
//  Created by 김동현 on 6/25/25.
//

import Foundation

// 1. 최소값 구하기
func minTest() {
    var minValue = Int.max
    let arr = [1, 2, 3, 4, 5]

    for num in arr {
        if num < minValue {
            minValue = num
        }
    }
    print(minValue)
    // 1
}

// 2. 튜플 정렬하기
func sortTuple() {
    let score = [
        ("A", 10),
        ("B", 20),
        ("C", 30)
    ]
    
    let sorted = score.sorted { $0.1 < $1.1 }
    print(sorted)
    // [("A", 10), ("B", 20), ("C", 30)]
}

// 3. 알파벳순 정렬 후 점수순 정렬
func sortStringAndInt() {
    let score = [
        ("B", 20),
        ("A", 20),
        ("C", 10),
        ("A", 30)
    ]
    
    let sorted = score.sorted {
        if $0.0 == $1.0 {
            return $0.1 < $1.1 // 2. 알파벳이 같다면 점수순
        } else {
            return $0.0 < $1.0 // 1. 기본은 알파벳순
        }
    }
    print(sorted)
    // [("A", 20), ("A", 30), ("B", 20), ("C", 10)]
}

// 4. 딕셔너리 정렬하기
func sortDic() {
    let score: [String:Int] = [
        "A":30,
        "B":20,
        "c":10
    ]
    
    let sorted = score.sorted { $0.value < $1.value }
    print(sorted)
    // [(key: "c", value: 10), (key: "B", value: 20), (key: "A", value: 30)]
}


