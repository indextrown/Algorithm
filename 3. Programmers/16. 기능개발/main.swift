//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/13/25.
//

import Foundation

/*
    [a / b 에서 몫...나머지 일때 나머지가 존재하면 목 + 1]
    == (a + b - 1) / b

    [ex]
    let day = Int(ceil(Double(100 - progresses[i])/Double(speeds[i])))
    == let day = (100 - progresses[i] + speeds[i] - 1)/speeds[i]
*/
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var days: [Int] = []
    var dic: [Int: Int] = [:]
    for i in 0..<progresses.count {
        let day = (100 - progresses[i] + speeds[i] - 1)/speeds[i]
        days.append(day)
    }
    
    for i in 1..<days.count {
        if days[i-1] > days[i] {
            days[i] = days[i-1]
        }
    }
    
    for day in days {
        dic[day, default: 0] += 1
    }
    
    let result = dic.sorted { $0.key < $1.key }.map { $0.value }
    return result
}
