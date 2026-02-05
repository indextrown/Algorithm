//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 2/2/26.
//
/*
 https://ios-development.tistory.com/379
 https://velog.io/@heyksw/Swift-로-알고리즘-해결-팁
 https://chanhhh.tistory.com/70
 
 swift는 string형에서 인덱스에 int로 접근 불가
 swift는 인덱스 값에 int가 아닌 index 자료형의 위치
 */

import Foundation

var str = "Hello World"

// 전체 출력
print(str[str.startIndex..<str.endIndex])

// 부분 문자열 출력
print(str[str.startIndex..<str.index(str.startIndex, offsetBy: 5)])
print(str[str.index(str.startIndex, offsetBy: 1)..<str.index(str.startIndex, offsetBy: 5)])

// 앞에서부터 3개의 문자열을 출력
print(str.prefix(3))

// 뒤에서부터 3개의 문자열을 출력
print(str.suffix(3))

// 앞에서 2글자 제거 (원본 유지)
print(str.dropFirst(2))

// 뒤에서 2글자 제거 (원본 유지)
print(str.dropLast(2))

// 앞에서 2글자 제거 (원본 변경)
str.removeFirst(2)

// 뒤에서 2글자 제거 (원본 변경)
str.removeLast(2)

// 범위를 초과해도 안전 (자동 보정)
print(str.prefix(100))

// 해당 문자열을 거꾸로 출력
let reversedStr = String(str.reversed())
print(reversedStr)

// 거꾸로된 해당 문자열 끝에 "Index" 문자열을 추가(+연산자가 자동으로 String으로 만들어줌)
// let res = String(str.reversed()) + "Index"
print(str.reversed() + "Index")

// tip: removeFirst()보다 효율적인 방법
let arr = [1, 2, 3]
var idx = 0
while idx < arr.count {
    let value = arr[idx]
    idx += 1
    print(value)
}

let str2 = "Hello World"
print(str2[0..<5])   // Hello
print(str2[1..<5])   // ello


// 서브스크립트 만들기
extension String {
    
    /// [start, end) 형태 슬라이싱
    subscript(_ range: Range<Int>) -> String {
        let lower = max(0, range.lowerBound)
        let upper = min(self.count, range.upperBound)
        guard lower < upper else { return "" }
        
        // 1번 방식
        // return String(self.dropFirst(lower).prefix(upper - lower))

        // 2번 방식
        let startIdx = self.index(self.startIndex, offsetBy: lower)
        let endIdx = self.index(self.startIndex, offsetBy: upper)
        return String(self[startIdx..<endIdx])
    }
    
    /// [start...end] (end 포함)
    subscript(_ range: ClosedRange<Int>) -> String {
        return self[range.lowerBound..<range.upperBound + 1]
    }
    
    /// print(str[start: 1, length: 4]) // ello
    subscript(start: Int, length: Int) -> String {
        guard length > 0 else { return "" }
        return self[start..<start + length]
    }
}

