//
//  File.swift
//  Algorithm
//
//  Created by 김동현 on 7/22/24.
//

import Foundation

@main
struct Main {
    static func main() {
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!

        // 결과 계산 및 출력
        let result = min(a, b) * 100 / 2
        print(result)
    }
}



//@main
//struct Main {
//    static func main() {
//        let input = readLine()!
//        let numbers = input.split(separator: " ").compactMap { Int($0) }
//        
//        // 입력받은 정수를 a와 b에 할당합니다.
//        let a = numbers[0]
//        let b = numbers[1]
//        
//        // 결과 계산 및 출력
//        let result = min(a, b) * 100 / 2
//        print(result)
//        
//    }
//}
