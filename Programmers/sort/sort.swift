//
//  01.swift.swift
//  Algorithm
//
//  Created by 김동현 on 7/16/24.
//

import Foundation

func solution(_ arr: [Int]) -> [Int] {
    return arr.sorted()
}

func solprint(_ arr: [Int]) {
    for i in arr {
        print(i, separator: " ")
    }
}

@main
struct Main {
    static func main() {
        let a = [5, 4, 3, 2, 1]
        solprint(solution(a))
    }
}

