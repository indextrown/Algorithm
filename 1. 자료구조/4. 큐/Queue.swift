//
//  Queue.swift
//  Algorithm
//
//  Created by 김동현 on 12/30/25.
//
// https://linux-studying.tistory.com/38
// https://babbab2.tistory.com/136
/*
 |Benchmark         |Time(sec)         |
 |:-----------------|-----------------:|
 |Queue Test        |0.333168          |
 |CursorQueue Test  |1.754397          |
 |CircularQueue Test|0.334627          |
 */

import Foundation

struct Queue<T> {
    private var input: [T] = []
    private var output: [T] = []
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        return input.count + output.count
    }
    
    mutating func enqueue(_ element: T) {
        self.input.append(element)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()   // O(n)
        }
        return output.popLast() // O(1)
    }
}

struct CursorQueue<T> {
    var input: [T] = []
    var cursor = 0
    
    var count: Int {
        return input.count - cursor
    }
    
    var isEmpty: Bool {
        return count == cursor
    }
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard cursor < input.count else { return nil }
        
        defer {
            cursor += 1
            
            if cursor >= 100 && cursor < input.count {
                input = Array(input[cursor..<input.count])
                cursor = 0
            }
        }
        
        return input[cursor]
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

    @discardableResult
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
        let runner = BenchmarkRunner(
            Benchmark(name: "Queue Test") {
                var queue = Queue<Int>()
                return {
                    for i in 0..<1_000_000 {
                        queue.enqueue(i)
                    }
                    
                    for _ in 0..<1_000_000 {
                        _ = queue.dequeue()
                    }
                }
            },
            
            Benchmark(name: "CursorQueue Test") {
                var queue = CursorQueue<Int>()
                return {
                    for i in 0..<1_000_000 {
                        queue.enqueue(i)
                    }
                    
                    for _ in 0..<1_000_000 {
                        _ = queue.dequeue()
                    }
                }
            },
            
            Benchmark(name: "CircularQueue Test") {
                var queue = CircularQueue<Int>(1_000_000)
                return {
                    for i in 0..<1_000_000 {
                        queue.enqueue(i)
                    }
                    
                    for _ in 0..<1_000_000 {
                        _ = queue.dequeue()
                    }
                }
            }
        )
        
        runner.run()
    }
}
