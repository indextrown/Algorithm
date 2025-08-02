//
//  0. 큐.swift
//  Algorithm
//
//  Created by 김동현 on 8/2/25.
//

import Foundation

struct DoubleStackQueue<T> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    var count: Int {
        return enqueueStack.count + dequeueStack.count
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
    
    func peek() -> T? {
        if let last = dequeueStack.last {
            return last
        }
        return enqueueStack.first
    }
}

struct CircularQueue<T> {
    private var buffer: [T?]
    private var capacity: Int
    private var front = 0
    private var rear = 0
    private var count = 0

    init(_ size: Int) {
        self.capacity = size
        self.buffer = Array(repeating: nil, count: size)
    }

    var isEmpty: Bool {
        return count == 0
    }

    var isFull: Bool {
        return count == capacity
    }

    mutating func enqueue(_ element: T) -> Bool {
        guard !isFull else { return false }

        buffer[rear] = element
        rear = (rear + 1) % capacity
        count += 1
        return true
    }

    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }

        let value = buffer[front]
        buffer[front] = nil
        front = (front + 1) % capacity
        count -= 1
        return value
    }

    func peek() -> T? {
        return buffer[front]
    }
}


@main
struct Main {
    static func main() {
        let N = 10_000_000 // 테스트할 데이터 수

        // MARK: - DoubleStackQueue 테스트
        var doubleStackQueue = DoubleStackQueue<Int>()

        var start = CFAbsoluteTimeGetCurrent()
        for i in 0..<N {
            doubleStackQueue.enqueue(i)
        }
        for _ in 0..<N {
            _ = doubleStackQueue.dequeue()
        }
        let duration1 = CFAbsoluteTimeGetCurrent() - start
        print("DoubleStackQueue: \(String(format: "%.5f", duration1))초")

        // MARK: - CircularQueue 테스트
        var circularQueue = CircularQueue<Int>(N)

        start = CFAbsoluteTimeGetCurrent()
        for i in 0..<N {
            _ = circularQueue.enqueue(i)
        }
        for _ in 0..<N {
            _ = circularQueue.dequeue()
        }
        let duration2 = CFAbsoluteTimeGetCurrent() - start
        print("CircularQueue:     \(String(format: "%.5f", duration2))초")
    }
}
