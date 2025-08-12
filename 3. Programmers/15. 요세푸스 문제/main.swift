//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/12/25.
//

import Foundation
freopen("input.txt", "r", stdin)

struct Queue<T> {
    private var inStack: [T] = []
    private var outStack: [T] = []
    
    var isEmpty: Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        inStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll()
        }
        return outStack.popLast()
    }
    
    func peek() -> T? {
        if let last = outStack.last {
            return last
        }
        return outStack.first
    }
}


let input = readLine()!
let parts = input.split(separator: " ")
let (n, k) = (Int(parts[0])!, Int(parts[1])!)

var q = Queue<Int>()
var removed: [Int] = []

for i in (1...n) {
    q.enqueue(i)
}

while !q.isEmpty {
    // k-1 회전(앞에서 빼서 뒤에 붙이기
    for _ in 0..<(k-1) {
        if let front = q.dequeue() {
            q.enqueue(front)
        }
    }
    
    // k번째 제거
    removed.append(q.dequeue()!)
}

let output = "<" + removed.map { String($0) }.joined(separator: ", ") + ">"
print(output)

