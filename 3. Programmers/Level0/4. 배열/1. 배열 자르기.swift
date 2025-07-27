//
//  1. 배열 자르기.swift
//  Algorithm
//
//  Created by 김동현 on 7/12/25.
//

import Foundation

func solution(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    return Array(numbers[num1...num2])
}

func solution2(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    return (num1...num2).map { numbers[$0] }
}
