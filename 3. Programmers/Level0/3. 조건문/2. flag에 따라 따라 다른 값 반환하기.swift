//
//  2. flag에 따라 따라 다른 값 반환하기.swift
//  Algorithm
//
//  Created by 김동현 on 7/8/25.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ flag:Bool) -> Int {
    return flag ? a + b : a - b
}
