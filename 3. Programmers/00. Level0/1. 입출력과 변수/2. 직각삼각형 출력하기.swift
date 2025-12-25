//
//  2. 직각삼각형 출력하기.swift
//  Algorithm
//
//  Created by 김동현 on 7/6/25.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }

/*
1번 방식
for cnt in 1...n[0] {
    let str = String(repeating: "*", count: cnt)
    print(str)
}
*/

/*
let length = n.first!
(1...length).forEach {
    print((1...$0).map { _ in "*" }.joined())
}
*/
