//
//  0. time.swift
//  Algorithm
//
//  Created by 김동현 on 7/16/25.
//

import Foundation

@main
struct Main {
    static func main() {
        let start = CFAbsoluteTimeGetCurrent()

        for _ in 0..<10000 {
            print("test")
        }

        let end = CFAbsoluteTimeGetCurrent()
        let duration = end - start
        print("수행시간은 \(duration)초입니다.")
    }
}

