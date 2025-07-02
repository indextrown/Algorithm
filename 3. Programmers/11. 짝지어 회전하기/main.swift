//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 7/3/25.
//

import Foundation

func solution(_ s:String) -> Int{
    
    var stack: [Character] = []
    
    for ch in s {
        if stack.isEmpty {
            stack.append(ch)
        } else {
            if stack.last! == ch {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

func solution2(_ s:String) -> Int{
    
    var stack: [Character] = []
    
    for ch in s {
        // 단락평가: 첫 조건이 false이면 두번째 조건이 평가되지 않음
        if !stack.isEmpty && stack.last! == ch {
            stack.removeLast()
        } else {
            stack.append(ch)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}

func printSolution(_ vec: Int) {
    print(vec)
}

// 메인 함수
func main() {
    printSolution(solution("baabaa"))
    printSolution(solution("cdcd"))
    
    printSolution(solution2("baabaa"))
    printSolution(solution2("cdcd"))
}

main()
