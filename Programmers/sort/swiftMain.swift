//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 7/16/24.
//


/*
 
 
 import Foundation:

 Foundation 프레임워크를 임포트합니다. 이 프레임워크는 Swift에서 유용한 기본 데이터 유형, 컬렉션, 날짜 및 시간 관련 기능 등을 제공합니다. 여기서는 print 함수를 사용할 수 있게 해줍니다.
 @main:

 @main 속성은 Swift 5.3에서 도입된 것으로, 프로그램의 진입점을 정의합니다. 전통적인 C 계열 언어에서의 main 함수 역할을 합니다. 이 속성을 사용하면 Swift가 어디서 프로그램을 시작해야 하는지 알 수 있습니다.
 struct Main:

 Main이라는 구조체를 정의합니다. 이 구조체는 프로그램의 주 진입점을 제공합니다.
 static func main():

 main이라는 정적 함수를 정의합니다. 이 함수는 프로그램이 시작될 때 호출됩니다. @main 속성이 적용된 구조체 또는 클래스에서는 이 함수가 진입점이 됩니다.
 print("test"):

 main 함수 내에서 print 함수를 호출하여 "test" 문자열을 출력합니다. 이는 프로그램이 실행될 때 콘솔에 "test"가 표시됨을 의미합니다.
 
 
 */


//import Foundation
//
//// @main 속성을 사용하면 전통적인 main.swift 파일을 만들 필요 없이도 프로그램의 진입점을 정의할 수 있어 코드 구조를 보다 간결하게 유지할 수 있습니다.
//@main
//struct Main {
//    static func main() {
//        print("test")
//    }
//}


import Foundation

func solution(_ arr: [Int]) -> [Int] {
    return arr.sorted()
}

// 테스트 코드

func printArray(_ arr: [Int]) {
    for num in arr {
        print(num, terminator: " ")
    }
    print()
}


@main
struct Main {
    static func main() {
        printArray(solution([1, -5, 2, 4, 3]))      // -5 1 2 3 4
        printArray(solution([2, 1, 1, 3, 2, 5, 4])) // 1 1 2 2 3 4 5
        printArray(solution([6, 1, 7]))             // 1 6 7

    }
}
