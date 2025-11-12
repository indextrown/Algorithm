//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/13/25.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var a: Int = a
    var b: Int = b
    
    while a != b {
        a = (a + 1) / 2
        b = (b + 1) / 2
        answer += 1
    }
    return answer
}
