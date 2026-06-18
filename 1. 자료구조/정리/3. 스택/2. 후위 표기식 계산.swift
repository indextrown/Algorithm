//
//  2. 후위 표기식 계산.swift
//  Algorithm
//
//  Created by 김동현 on 8/23/25.
//

import Foundation

func eval(expr: String) -> Int {
    
    var stack: [Int] = []
    
    // 공백이 있다면 -> 공백 기준 토큰화
    let tokens: [String]
    if expr.contains(" ") {
        tokens = expr.split(separator: " ").map { String($0) }
    }
    else {
        tokens = expr.map { String($0) }
    }
    
    for token in tokens {
        // 연산자가 아니라면(숫자라면)
        if let num = Int(token) {
            stack.append(num)
        }
        // 연산자라면
        else {
            let op2 = stack.removeLast()
            let op1 = stack.removeLast()
            
            switch token {
            case "+": stack.append(op1 + op2)
            case "-": stack.append(op1 - op2)
            case "*": stack.append(op1 * op2)
            case "/": stack.append(op1 / op2)
            default: break
            }
        }
    }
    
    return stack.removeLast()
}

@main
struct Main {
    static func main() {
        // 한 자리, 공백 없는 표현
        let expr1 = "82/3-32*+"
        print("결과1: \(eval(expr: expr1))")  // 7

        // 다자리, 공백 구분 표현
        let expr2 = "12 3 +"
        print("결과2: \(eval(expr: expr2))")  // 15

        // 복합 예시
        let expr3 = "10 2 8 * + 3 -"  // 10 + (2*8) - 3 = 23
        print("결과3: \(eval(expr: expr3))")  // 23
    }
}
