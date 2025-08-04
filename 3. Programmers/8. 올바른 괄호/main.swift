//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/28/25.
//

import Foundation

// MARK: - 최초 시도
func solution(_ s:String) -> Bool
{
    var stack: [Character] = []
    stack.reserveCapacity(100_000)
    
    for c in s {
        
        // MARK: - 최초 시도
        // 만약 (라면 넣기
        if c == "(" { stack.append(c) }
        
        // 만약 )라면 stack의 top이 없으면 return false
        else if c == ")" && stack.last == nil { return false }
        
        // 만약 )라면 stack의 top이 (이면 stack.pop
        else if c == ")" && stack.last! == "(" { stack.removeLast() }
    }
    return stack.isEmpty
}

// MARK: - 두번째 시도
func solution2(_ s:String) -> Bool
{
    var stack: [Character] = []
    stack.reserveCapacity(100_000)
    
    for c in s {
        
        
        switch c {
        case "(":
            stack.append(c)
        case ")":
            // top이 있고 top이 ( 이면 pop
            if let top = stack.last, top == "(" {
                stack.removeLast()
                // top이 없거나, top이 있으나 )이면 false
            } else {
                return false
            }
        default:
            return false
        }
    }
    return stack.isEmpty
}

// MARK: - 세번째 시도
func solution3(_ s:String) -> Bool
{
    var openCnt: Int = 0, closeCnt: Int = 0
    var answer: Bool = false
    
    for c in s {
        
        switch c {
        case "(":
            openCnt += 1
        case ")":
            closeCnt += 1
        default:
            break
        }
        
        guard openCnt >= closeCnt else {
            break
        }
    }
    answer = openCnt == closeCnt
    return answer
}


func solution4(_ s:String) -> Bool {
    var stack: [String] = []
    
    for c in s {
        if c == "(" {
            stack.append(c)
        }
        else if c == ")" {
            if stack.last == nil {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    
    return stack.isEmpty
}

