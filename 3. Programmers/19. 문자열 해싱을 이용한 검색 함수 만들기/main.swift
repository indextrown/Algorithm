//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/15/25.
//

import Foundation

@inline(__always)
func polynomialHash(str: String) -> Int {
    let p = 31
    let m = 1_000_000_007
    var hashValue = 0
    
    for c in str {
        let value = Int(c.asciiValue!) - 96
        hashValue = (hashValue * p + value) % m
    }
    return hashValue
}

func solution(_ stringList:[String], _ queryList:[String]) -> [Bool] {
    
    var hashSet: Set<Int> = []
    var result: [Bool] = []
    
    for str in stringList {
        let hash = polynomialHash(str: str)
        hashSet.insert(hash)
    }
    
    for query in queryList {
        let hash = polynomialHash(str: query)
        let found = hashSet.contains(hash)
        result.append(found)
    }

    return result
}

// print(solution(["apple", "banana", "cherry"], ["banana", "kiwi", "melon", "apple"]))


//let serverKeywords = ["apple", "banana", "cherry"]
//let keywordSet = Set<String>(serverKeywords)
//let quary = "a"
//let matched = serverKeywords.filter { $0.contains(quary) }
//print(matched)

