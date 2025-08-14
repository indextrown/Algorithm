//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/15/25.
//

import Foundation

func solution(_ arr:[Int], target: Int) -> Bool {
    for i in 0..<arr.count {
        for j in i+1..<arr.count {
            let sum = arr[i] + arr[j]
            if sum == target {
                return true
            }
        }
    }
    return false
}

@inline(__always)
func makeHash(arr: [Int], target: Int) -> [Int: Int] {
    var hash: [Int:Int] = [:]
    for i in 0..<arr.count {
        if arr[i] > target { continue }
        hash[arr[i]] = 1
    }
    return hash
}

func solution2(_ arr:[Int], target: Int) -> Bool {
    let hash = makeHash(arr: arr, target: target)
    
    for i in 0..<arr.count {
        let num = target - arr[i]
        
        if arr[i] == num || num < 0 { continue }
        
        if let _ = hash[num] {
            return true
        }
    }
    return false
}

print(solution2([1, 2, 3, 4, 8], target: 6))
