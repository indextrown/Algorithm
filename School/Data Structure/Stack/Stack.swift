//
//  Stack.swift
//  Algorithm
//
//  Created by 김동현 on 7/15/24.
//

import Foundation

// 스택 구조체 정의
struct Stack<T> {
    private var elements: [T] = []
    
    // 스택이 비어있는지 확인
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // 스택에 데이터 추가
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // 스택에서 데이터 추출
    mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        return elements.removeLast()
    }
    
    // 스택의 가장 상단 데이터 반환
    func peek() -> T? {
        return elements.last
    }
    
    // 스택의 크기 반환
    var count: Int {
        return elements.count
    }
}

// 프로그램의 진입점 정의
@main
struct Main {
    static func main() {
        // 스택 인스턴스 생성
        var stack = Stack<Int>()
        
        // 스택에 데이터 추가
        stack.push(10)
        stack.push(20)
        stack.push(30)
        
        // 스택에서 데이터 추출 및 출력
        if let topElement = stack.pop() {
            print("Popped element: \(topElement)")
        }
        
        // 스택의 가장 상단 데이터 출력
        if let topElement = stack.peek() {
            print("Top element: \(topElement)")
        }
        
        // 스택의 크기 출력
        print("Stack count: \(stack.count)")
    }
}


