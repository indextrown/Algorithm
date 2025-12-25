//
//  3. 두 수의 나눗셈.swift
//  Algorithm
//
//  Created by 김동현 on 7/6/25.
//

import Foundation

/*
func solution(_ num1:Int, _ num2:Int) -> Int {
    let a = Double(num1)/Double(num2) * 1000
    return Int(a)
}
*/

func solution(_ num1:Int, _ num2:Int) -> Int {
    let a = num1*1000/num2
    return a
}
