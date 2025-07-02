//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 7/2/25.
//

import Foundation

func solution(_ s:String) -> Int {
    
    var count = 0
    let dic: [Character: Character] = [
        ")": "(",
        "}": "{",
        "]": "["
    ]

    for i in 0..<s.count {
        let startIndex = s.index(s.startIndex, offsetBy: i)
        let subString1 = s[startIndex...]
        let subString2 = s[s.startIndex..<startIndex]
        let temp = subString1 + subString2
        var stack: [Character] = []
        
        for c in temp {
            // 열린괄호는 바로 넣기
            if c == "(" || c == "{" || c == "[" {
                stack.append(c)
            // 닫힘 괄호일 때
            } else {
                // 스택 비어있으면
                if stack.isEmpty {
                    // 그냥 넣기
                    stack.append(c)
                // 스택 안비어있으면
                } else {
                    // 스택 최상단이 dic[)] == ( 라면
                    if stack.last == dic[c] {
                        stack.removeLast()
                    } else {
                        stack.append(c)
                    }
                }
            }
        }
        if stack.isEmpty {
            count += 1
        }
    }
    return count
}

func solution2(_ s:String) -> Int {
    var count = 0
    let dic: [Character: Character] = [
        ")":"(", "}":"{", "]":"["
    ]
    
    
    let arr = Array(s)
    let arrCnt = arr.count
    for i in 0..<arrCnt {
        let temp = arr[i...] + arr[0..<i]
        var stack: [Character] = []
        var isValid = true
        
        for c in temp {
            // 닫힌 괄호라면
            if let open = dic[c] {
                if stack.isEmpty || stack.last! != open {
                    isValid = false
                    break
                }
                stack.removeLast()
            // 열린 괄호라면
            } else {
                stack.append(c)
            }
        }
        
        if  isValid && stack.isEmpty {
            count += 1
        }
    }
    
    return count
}

func printSolution(_ vec: Int) {
    print(vec)
}

// 메인 함수
func main() {
    printSolution(solution("[](){}"))
    printSolution(solution("}]()[{"))
    printSolution(solution("[)(]"))
    printSolution(solution("}}}"))
}

main()
