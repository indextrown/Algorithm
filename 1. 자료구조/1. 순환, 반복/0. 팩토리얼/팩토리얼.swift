//
//  0.팩토리얼.swift
//  Algorithm
//
//  Created by 김동현 on 7/28/25.
//

import Foundation

func factorial(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    return n * factorial(n - 1)
}

func factorial2(_ n: Int) -> Int {
    return (1...n).reduce(1, *)
    // return (1...n).reduce(1) { $0 * $1 }
}

@main
struct Main {
    static func main() {
        let result = factorial(3)
        print(result)
        
//        let result2 = factorial2(10)
//        print(result2)
    }
}
