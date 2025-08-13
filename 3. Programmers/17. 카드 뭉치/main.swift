//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/14/25.
//

import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var cards1Queue = Array(cards1.reversed())
    var cards2Queue = Array(cards2.reversed())
    var goalQueue = Array(goal.reversed())
    
    for _ in 0..<goal.count {
        
        if let last = cards1Queue.last, last == goalQueue.last! {
            cards1Queue.removeLast()
            goalQueue.removeLast()
        }
        
        else if let last = cards2Queue.last, last == goalQueue.last! {
            cards2Queue.removeLast()
            goalQueue.removeLast()
        }
        
        else {
            break;
        }
    }
    
    let result = goalQueue.isEmpty ? "Yes" : "No"
    return result
}

func solution1(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var cards1Queue = Array(cards1.reversed())
    var cards2Queue = Array(cards2.reversed())

    for word in goal {
        if !cards1Queue.isEmpty, cards1Queue.last! == word  {
            cards1Queue.removeLast()
        } else if !cards2Queue.isEmpty, cards2Queue.last! == word {
            cards2Queue.removeLast()
        } else {
            return "No"
        }
    }

    return "Yes"
}

func solution2(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var i = 0, j = 0
    
    for word in goal {
        if i < cards1.count, cards1[i] == word {
            i += 1
        }
        
        else if j < cards2.count, cards2[j] == word {
            j += 1
        }
        
        else {
            return "No"
        }
    }
    
    return "Yes"
}


print(solution(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"]))
