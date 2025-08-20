//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/25/25.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var challenger = Array(repeating: 0, count: N+2)
    var failer = Array(repeating: 0, count: N+2)
    var userDic: [Int:Double] = [:]
    
    for stage in stages {
        for num in 1...stage {
            challenger[num] += 1
        }
        failer[stage] += 1
    }
    
    for idx in 1..<N+1 {
        if challenger[idx] == 0 {
            userDic[idx] = 0
        } else {
            userDic[idx, default: 0] = Double(failer[idx])/Double(challenger[idx])
        }
    }
    
    let result = userDic.sorted {
        if $0.value == $1.value {
            return $0.key < $1.key
        } else {
            return $0.value > $1.value
        }
    }.map { $0.key }

    
    return result
}
