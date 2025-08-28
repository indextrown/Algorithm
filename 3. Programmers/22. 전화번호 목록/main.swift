//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/28/25.
//

import Foundation

func solution(_ phone_book:[String]) -> Bool {
    let sorted = phone_book.sorted()
    
    
    for i in 1..<sorted.count {
        if sorted[i].hasPrefix(sorted[i-1]) {
            return false
        }
    }
    return true
}



print(solution(["119", "97674223", "1195524421"]))
print(solution(["123","456","789"]))
print(solution(["12","123","1235","567","88"]))

