//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 7/3/25.
//

import Foundation

freopen("input.txt", "r", stdin)

let n = Int(readLine()!)!


for _ in 0..<n {
    let str = readLine()!
    print(str)
    
    var stack: [Int] = []
    for i in 1..<str.count {
        var temp = 0
        let index = str.index(str.startIndex, offsetBy: i)
        let indexPrev = str.index(str.startIndex, offsetBy: i-1)
        print(str[index])
        
        // 현재가 정수라면
        if let currnet = Int(String(str[index])) {
            
            // 이전값도 정수라면
            if let prev = Int(String(str[indexPrev])) {
                temp = temp * 10 + currnet
            // 이전 값은 정수 아니라면
            } else {
                temp = 0
                temp = temp * 10 + currnet
                stack.append(temp)
            }
        }
    }
    print(stack)
}
