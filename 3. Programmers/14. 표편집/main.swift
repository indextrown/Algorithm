//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/9/25.
//

/*
 5 <= n <= 1,000,000
 0 <= k <= n
 1 <= cmd원소개수 <= 200,000
 1 <= x <= 300,000
 x전체합 <= 1,000,000
 
 
 T = O(n) + O(cmd) + O((∑X))
 
 */
import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var droppedStack: [Int] = []
    var up: [Int] = []
    var down: [Int] = []
    var row = k
    
    // O(n)
    for i in 0..<n+2 {
        up.append(i-1)
        down.append(i+1)
    }
    
    // 현재 위치
    row += 1
    
    // O(n)
    for c in cmd {
        let parts = c.split(separator: " ")
        let command = parts[0]
        
        // 삭제(현재 위치를 삭제하고 그 다음 위치로 이동)
        if command == "C" {
            droppedStack.append(row)
            up[down[row]] = up[row]
            down[up[row]] = down[row]
            
            // 맨마지막을 지웠다면 위로 이동
            if down[row] == n+1 {
                row = up[row]
            }
            // 아니면 다음 행으로 이동
            else {
                row = down[row]
            }
        }
        
        // 복원
        else if command == "Z" {
            let restore = droppedStack.popLast()!
            down[up[restore]] = restore
            up[down[restore]] = restore
        }
        
        // 위로 이동
        else if command == "U" {
            let move = Int(parts[1])!
            
            // O(∑X)
            for _ in 0..<move {
                row = up[row]
            }
        }
        
        // 아래로 이동
        else if command == "D" {
            let move = Int(parts[1])!
            
            // O(∑X)
            for _ in 0..<move {
                row = down[row]
            }
        }
    }
    
    // O(n)
    var answer = Array(repeating: Character("O"), count: n)
    
    // O(n)
    while let last = droppedStack.popLast() {
        answer[last-1] = "X"
    }
    
    // O(n)
    return String(answer)
}

print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))




