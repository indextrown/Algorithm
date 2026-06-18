//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/20/26.
//
// https://velog.io/@gundy/Swift-Swift에서-Queue는-뭘로-구현해야-할까

import Foundation

struct DoubleStackQueue<Element> {
    private var inStack: [Element] = []
    private var outStack: [Element] = []
    
    mutating func enqueue(_ newElement: Element) {
        inStack.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.popLast()
    }
}
