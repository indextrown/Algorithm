//
//  3. 간단한 논리 연산.swift
//  Algorithm
//
//  Created by 김동현 on 7/8/25.
//

import Foundation

func solution(_ x1:Bool, _ x2:Bool, _ x3:Bool, _ x4:Bool) -> Bool {
    let result = (x1 || x2) && (x3 || x4)
    return result
}
