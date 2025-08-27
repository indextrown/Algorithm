//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/27/25.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var dic: [String: Int] = [:]
    dic[words[0]] = 1 // 첫 단어 등록
    
    for i in 1..<words.count {
        let player = (i % n) + 1
        let round = (i / n) + 1
        let before = words[i-1]
        let now = words[i]
        
        // 이전 끝단어와 현재 첫단어가 다르다면 게임오버
        if before.last! != now.first! { return [player, round] }
        
        // 기존 등장 단어 사용하면 게임오버
        if dic[now] != nil { return [player, round] }
        
        // 현재 글자가 한자리면 게임오버
        if now.count == 1 { return [player, round] }
        
        // 통과
        dic[now, default: 0] += 1
    }

    return [0, 0]
}

func solution2(_ n:Int, _ words:[String]) -> [Int] {
    var set: Set<String> = []
    set.insert(words[0])
    
    for i in 1..<words.count {
        let player = (i % n) + 1
        let round = (i / n) + 1
        let before = words[i-1]
        let now = words[i]
        
        // 이전 끝단어와 현재 첫단어가 다르다면 게임오버
        if before.last! != now.first! { return [player, round] }
        
        // 기존 등장 단어 사용하면 게임오버
        if set.contains(now) { return [player, round] }
        
        // 현재 글자가 한자리면 게임오버
        if now.count == 1 { return [player, round] }
        
        set.insert(now)
    }
    
    return [0, 0]
}

 print(solution(3,["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
print(solution2(3,["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
