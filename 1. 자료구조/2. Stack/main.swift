//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/20/26.
//
// https://babbab2.tistory.com/85

import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}
