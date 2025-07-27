//
//  3. 뒤에서 5등 위로.swift
//  Algorithm
//
//  Created by 김동현 on 7/28/25.
//

import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    let list = num_list.sorted { $0 < $1 }
    return Array(list[5...])
}

func solution2(_ num_list:[Int]) -> [Int] {
    return Array(num_list.sorted().suffix(num_list.count - 5))
}
