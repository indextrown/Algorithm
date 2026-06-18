//
//  1. 괄호 문제.swift
//  Algorithm
//
//  Created by 김동현 on 8/22/25.
//

import Foundation

func checkMatching(s: String) -> Bool {
    var stack: [Character] = []
    
    for c in s {
        switch c {
        case "(", "[", "{":
            stack.append(c)
        case ")", "]", "}":
            if stack.isEmpty { return false }
            
            let top = stack.removeLast()
            if !(top == "(" && c == ")" ||
                top == "[" && c == "]" ||
                top == "{" && c == "}") {
                return false
            }
        default:
            break
        }
    }
    
    return stack.isEmpty ? true : false;
}

func checkMatching2(s: String) -> Bool {
    var stack: [Character] = []
    let dic: [Character: Character] = [
        ")": "(",
        "]": "[",
        "}": "{"
    ]
    
    for c in s {
        // 열린 괄호라면
        if dic.values.contains(c) {
            stack.append(c)
        // open: 기대 값
        } else if let open = dic[c] {
            // 비어있거나 top의 값이 기대 값과 다르다면 실패
            if stack.isEmpty || stack.removeLast() != open {
                return false
            }
        }
            
    }
    return stack.isEmpty ? true : false
}

// 테스트용 대량 문자열 생성
func generateTestString(repeats: Int) -> String {
    return String(repeating: "{[()]}", count: repeats)
}

// 성능 측정 함수
func measure(title: String, block: () -> Void) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000
    print("\(title): \(timeInterval)ms")
}


@main
struct Main {
    static func main() {
        
        let s: String = "{ A[(i+1)]=0; }"
        if checkMatching(s: s) {
            print("\(s) 괄호검사 성공")
        } else {
            print("\(s) 괄호검사 실패")
        }
        

        if checkMatching2(s: s) {
            print("\(s) 괄호검사 성공")
        } else {
            print("\(s) 괄호검사 실패")
        }
        
        let testString = generateTestString(repeats: 1_000_000)  // 테스트 데이터
        
        measure(title: "checkMatching (조건문)") {
            _ = checkMatching(s: testString)
        }
        
        measure(title: "checkMatching2 (딕셔너리)") {
            _ = checkMatching2(s: testString)
        }
        
        
    }
}
