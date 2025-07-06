//
//  4. a와 b 출력하기.swift
//  Algorithm
//
//  Created by 김동현 on 7/6/25.
//

import Foundation

@main
struct Main {
    static func main() {
        let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
        let (a, b) = (n[0], n[1])

        print("a = \(a)")
        print("b = \(b)")
    }
}

