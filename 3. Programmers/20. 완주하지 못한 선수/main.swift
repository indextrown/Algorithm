//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/27/25.
//

import Foundation

func solution(_ participant:[String], _ completion:[String]) -> String {
    var dic: [String: Int] = [:]
    
    for people in participant {
        dic[people, default: 0] += 1
    }
    
    for people in completion {
        dic[people]! -= 1
        
        if dic[people]! == 0 {
            dic.removeValue(forKey: people)
        }
    }
    
    return dic.first!.key
}

print(solution(["leo", "kiki", "eden"],
               ["eden", "kiki"]))
