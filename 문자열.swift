//
//  문자열.swift
//  Algorithm
//
//  Created by 김동현 on 7/5/25.
//

import Foundation

// 특정 문자 가져오기
func strGet() {
    let s = "hello"
    let firstChar = s[s.startIndex]
    print(firstChar)
    
    let secondChar = s[s.index(after: s.startIndex)]
    print(secondChar)
    
    let index = s.index(s.startIndex, offsetBy: 2)
    let thirdChar = s[index]
    print(thirdChar)
    
    let lastChar = s[s.index(before: s.endIndex)]
    print(lastChar)
}

// 문자열 슬라이싱
func subString() {
    let s = "abcdef"
    let startIdx = s.index(s.startIndex, offsetBy: 1)
    let endIdx = s.index(s.startIndex, offsetBy: 3)
    
    let result = s[startIdx...endIdx]
    print(result)
}

// 문자열 -> 문자
func strToChar() {
    let arr = "swift"
    for c in arr {
        print(c)
    }
    
    let arr2 = Array(arr)
    for c in arr2 {
        print(c)
    }
}

// 문자열 -> 배열 -> 문자열
func joinToArr() {
    let str = "swift"
    let ss = str.split(separator: "")
    print(ss)
    
    let ss2 = ss.joined()
    print(ss2)
}

// 문자열 뒤집기
func reversedStr() {
    let str = "swift"
    print(String(str.reversed()))
    
    let str2 = "swift"
    let arr = Array(str2)
    print(String(arr.reversed()))
}

// 특정 문자 제거
func filterStr() {
    let str = "swift"
    let removed = str.filter { $0 != "i" }
    print(removed)
}

// 문자 카운트
func cntStr() {
    let str = "swift"
    let cnt = str.filter { $0 != "i" }.count
    print(cnt)
}

// 문자열 치환
func replaceStr() {
    let str = "hello world"
    let replaced = str.replacingOccurrences(of: "world", with: "swift")
    print(replaced)
}

// 대소문자 변환
func caseStr() {
    let str = "hello world"
    let upper = str.uppercased()
    let lower = str.lowercased()
    print(upper)
    print(lower)
    
    // 첫 문자만 대문자로 하는법
    let first = str.first!.uppercased()
    let result = first + str.dropFirst()
    print(result)
    
    // 첫 문자만 소문자로 하는법
    let test = "HELLO WORLD"
    let first2 = test.first!.lowercased()
    print(first2)
}

// 문자열 포함
func containStr() {
    let str = "hello world"
    if str.contains("world") {
        print("포함")
    }
}

// 공백 제거
func trimStr() {
    let str = "hello \nwo r l d"
    let trimmed = str.replacingOccurrences(of: "\\s+", with: "", options: .regularExpression)
    print(trimmed)
}

// 문자열 분리
func splitStr() {
    let str = "swift"
    let result = str.split(separator: "")
    print(result)
    
    let result2 = String(str.reversed())
    print(result2)
}

// 인덱스로 숫자 추출
func idxStr() {
    let str = "12345"
    let arrStr = Array(str)
    print(arrStr[1])
}

// 중복 문자 제거
func removeStr() {
    let s = "bananan"
    let result = Set(s)
    print(result)
}

// 중복 문자 제거(순서보장)
func removeStr2() {
//    let str = "bbannaa"
//    var unique = Set<Character>()
//    var str2 = ""
//    
//    for c in str {
//        if !unique.contains(c) {
//            unique.insert(c)
//            str2.append(c)
//        }
//    }
//    print(str2)
    
    let str = "aabbccx"
    var unique = Set<Character>()
    let result = str.filter { char in
        if unique.contains(char) {
            return false
        } else {
            unique.insert(char)
            return true
        }
    }
    
    print(result)
}

@main
struct Main {
    static func main() {
       
        removeStr2()
       
    }
}
