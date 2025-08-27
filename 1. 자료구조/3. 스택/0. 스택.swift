//
//  0. 스택.swift
//  Algorithm
//
//  Created by 김동현 on 8/2/25.
//
/*
 https://babbab2.tistory.com/85
 */

import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    var count: Int {
        return stack.count
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
    
    func peek() -> T? {
        return isEmpty ? nil : stack.last
    }
}

@main
struct Main {
    static func main() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
    
        while let num = stack.pop() {
            print(num)
        }
    }
}
