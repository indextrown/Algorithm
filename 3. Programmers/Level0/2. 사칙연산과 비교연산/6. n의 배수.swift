//
//  6. n의 배수.swift
//  Algorithm
//
//  Created by 김동현 on 7/6/25.
//

import Foundation

/*
func solution(_ num:Int, _ n:Int) -> Int {
    return num % n == 0 ? 1 : 0
}
*/

func solution(_ num:Int, _ n:Int) -> Int {
    return num.isMultiple(of: n) ? 1 : 0
}
