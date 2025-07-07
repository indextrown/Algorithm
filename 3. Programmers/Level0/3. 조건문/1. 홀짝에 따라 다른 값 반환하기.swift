//
//  1. 홀짝에 따라 다른 값 반환하기.swift
//  Algorithm
//
//  Created by 김동현 on 7/7/25.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/181935#

import Foundation

func solution(_ n:Int) -> Int {
    var sum = 0
    
    // 만약 홀수라면
    if n % 2 == 1 {
        for i in 1...n {
            if i % 2 == 1 { sum += i }
        }
    } else {
    // 만약 짝수라면
        for i in 1...n {
            if i % 2 == 0 { sum += i*i }
        }
    }
    
    return sum
}

func solution2(_ n:Int) -> Int {
    
    // 만약 홀수라면
    if n % 2 == 1 {
        return (1...n)
                    .lazy
                    .filter { $0 % 2 == 1 }
                    .reduce(0) { $0 + $1 }
    } else {
    // 만약 짝수라면
        return (1...n)
                    .lazy
                    .filter { $0 % 2 == 0 }
                    .reduce(0) { $0 + $1 * $1 }
    }
}
