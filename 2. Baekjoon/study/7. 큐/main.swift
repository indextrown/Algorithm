//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/14/25.
//

import Foundation
freopen("input.txt", "r", stdin)

struct Queue<T> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var size: Int {
        return enqueueStack.count + dequeueStack.count
    }
    
    var isEmpty: Int {
        return (size == 0) ? 1 : 0
    }
    
    var front: T? {
        if let last = dequeueStack.last { return last }
        return enqueueStack.first
    }
    
    var back: T? {
        if let last = enqueueStack.last { return last }
        return dequeueStack.first
    }
    
    mutating func push(_ element: T) {
        enqueueStack.append(element)
    }
    
    mutating func pop() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll(keepingCapacity: true)
        }
        return dequeueStack.popLast()
    }
}

let N = Int(readLine()!)!
var q = Queue<Int>()
for _ in 0..<N {
    let parts = readLine()!.split(separator: " ")
    
    switch parts[0] {
    case "push":
        q.push(Int(parts[1])!)
    case "pop":
        print(q.pop() ?? -1)
    case "front":
        print(q.front ?? -1)
    case "back":
        print(q.back ?? -1)
    case "size":
        print(q.size)
    case "empty":
        print(q.isEmpty)
    default:
        break
    }
}
