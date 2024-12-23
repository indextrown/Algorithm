//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/23/24.
//

import Foundation

// https://conandevdaily.tistory.com/30
// https://nasneyland.tistory.com/11

// MARK: - 사용자 정의
struct Stack<T>: Sequence {
    private var elements: [T] = []
    
    // 스택이 비어있는지
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // 데이터 추가
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // 데이터 추출
    mutating func pop() -> T? {
        return isEmpty ? nil : elements.popLast()
    }
    
    // 상단 데이터 반환
    func peek() -> T? {
        return elements.last
    }
    
    // 스택의 크기 반환
    var count: Int {
        return elements.count
    }
    
    // Sequence 프로토콜 준수를 위한 makeIterator 메서드 구현
    func makeIterator() -> IndexingIterator<[T]> {
        return elements.makeIterator()
    }
}

var stack = Stack<Int>()
stack.push(10)
stack.push(20)
stack.push(30)

// print(stack.pop()!)
// print(stack.pop()!)
// print(stack.pop()!)

// MARK: - Array방식
var arrStack = [Int]()
arrStack.append(1)
arrStack.append(2)

// print(arrStack.popLast() ?? 0)   // pop
// print(arrStack.last ?? 0)        // peek

