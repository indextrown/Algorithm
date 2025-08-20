//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/30/25.
//

import Foundation

/// 권장 시간 복잡도 O(logN)
// MARK: - 첫번째 시도
func solution(decimal: Int) -> String {
    var num = decimal
    var stack: [Int] = []
    while num != 0 {
        let div = num % 2
        stack.append(div)
        num /= 2
    }
    return stack.map { String($0) }.reversed().joined(separator: "")
}

// MARK: - 두번째 시도
func solution2(decimal: Int) -> String {
    var num = decimal
    var result = ""
    while num != 0 {
        let div = num % 2
        result = String(div) + result
        num /= 2
    }
    return result
}

// MARK: - 교재
func solution3(decimal: Int) -> String {
    var num = decimal
    var stack: [Int] = []
    
    while num != 0 {
        let div = num % 2
        stack.append(div)
        num /= 2
    }
    
    var result = ""
    while !stack.isEmpty {
        result += String(stack.removeLast())
    }
    return result
}


print(solution3(decimal: 10))
