//
//  5. 아이스 아메리카노.swift
//  Algorithm
//
//  Created by 김동현 on 7/6/25.
//

import Foundation

func solution(_ money:Int) -> [Int] {
    let coffee = money / 5500
    let remain = money % 5500
    return [coffee, remain]
}
