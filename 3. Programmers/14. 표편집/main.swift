//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/9/25.
//

import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var stack: [Int] = [] // 삭제 보관
    var row = k // 선택된 행
    var rowCount = n
    
    for c in cmd {
        let parts = c.split(separator: " ")
        let command = parts[0]
        let move = parts.count > 1 ? Int(parts[1])! : 0
        
        switch command {
        case "U":
            break
        case "D":
            row = min(rowCount - 1, row + move)
        case "C":
            break
        case "D":
            break
        default : break
        }
    }
    return ""
}

print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))
// print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]))

