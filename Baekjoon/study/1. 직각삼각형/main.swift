//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/29/24.
//
// https://didu-story.tistory.com/177

import Foundation

// freopen을 사용하여 입력을 파일로 리다이렉트
//  Swift는 C와 Objective-C 런타임을 기반으로 작동하기 때문에, 대부분의 C 표준 라이브러리 함수들을 그대로 사용할 수 있다
freopen("input.txt", "r", stdin)

while true {
    // readLine()을 강제 언래핑하고 입력값을 파싱
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    // 종료 조건: 모든 값이 0이면 반복문 종료
    if input.allSatisfy({ $0 == 0 }) {
        break
    }
    
    // 입력값 정렬
    let sortedInput = input.sorted(by: >)
    
    // 피타고라스 정리 확인
    if sortedInput[0] * sortedInput[0] == (sortedInput[1] * sortedInput[1] + sortedInput[2] * sortedInput[2]) {
        print("right")
    } else {
        print("wrong")
    }
}


//import Foundation

//var ongoing: Bool = true
//
//while true {
//    var input = readLine()!.split(separator: " ").map { Int($0)! }
//    
//    // 배열전체가 0이면 true
//    ongoing = input.allSatisfy { $0 != 0 }
//    
//    if !ongoing { break }
//    
//    input.sort(by: >)
//    
//    if input[0] * input[0] == (input[1] * input[1] + input[2] * input[2]) {
//        print("right")
//    } else {
//        print("wrong")
//    }
//}

//import Foundation


//freopen("input.txt", "r", stdin)
//
//while var input = readLine()?.split(separator: " ").map({ Int($0)! }), !input.allSatisfy({ $0 == 0 }) {
//    input.sort(by: >)
//    
//    if input[0] * input[0] == (input[1] * input[1] + input[2] * input[2]) {
//        print("right")
//    } else {
//        print("wrong")
//    }
//}
//


