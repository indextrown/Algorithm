//
//  7. 홀짝 구분하기.swift
//  Algorithm
//
//  Created by 김동현 on 7/6/25.
//

import Foundation

let a = Int(readLine()!)!
let result = a % 2 == 0 ? "even" : "odd"
print("\(a) is \(result)")
