//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 7/12/25.
//

import Foundation

func runQueuePerformanceTest() {
    
    let testCount = 100_000
    
    print("큐 종류별 enqueue / dequeue 성능 테스트 시작")
    
    enum QueueType: String, CaseIterable {
        case removeFirst = "1️⃣ removeFirst"
        case indexBased = "2️⃣ Index 기반"
        case structQueue = "3️⃣ 구조체 Queue"
        case doubleStack = "4️⃣ 더블 스택 Queue"
    }
    
    for type in QueueType.allCases {
        print("\n--- \(type.rawValue) ---")
        
        switch type {
        case .removeFirst:
            var queue: [(Int, Int)] = []
            
            var start = CFAbsoluteTimeGetCurrent()
            for i in 0..<testCount {
                queue.append((i, i))
            }
            var elapsed = CFAbsoluteTimeGetCurrent() - start
            print("  - Enqueue 시간: \(String(format: "%.4f", elapsed))초")
            
            start = CFAbsoluteTimeGetCurrent()
            while !queue.isEmpty {
                _ = queue.removeFirst()
            }
            elapsed = CFAbsoluteTimeGetCurrent() - start
            print("  - Dequeue 시간: \(String(format: "%.4f", elapsed))초")
            
        case .indexBased:
            var queue: [(Int, Int)] = []
            
            var start = CFAbsoluteTimeGetCurrent()
            for i in 0..<testCount {
                queue.append((i, i))
            }
            var elapsed = CFAbsoluteTimeGetCurrent() - start
            print("  - Enqueue 시간: \(String(format: "%.4f", elapsed))초")
            
            var index = 0
            start = CFAbsoluteTimeGetCurrent()
            while index < queue.count {
                _ = queue[index]
                index += 1
            }
            elapsed = CFAbsoluteTimeGetCurrent() - start
            print("  - Dequeue 시간: \(String(format: "%.4f", elapsed))초")
            
        case .structQueue:
            struct SimpleQueue<T> {
                private var storage: [T] = []
                private var front = 0
                
                var isEmpty: Bool {
                    front >= storage.count
                }
                
                mutating func enqueue(_ element: T) {
                    storage.append(element)
                }
                
                mutating func dequeue() -> T? {
                    guard !isEmpty else { return nil }
                    defer { front += 1 }
                    return storage[front]
                }
            }
            
            var queue = SimpleQueue<(Int, Int)>()
            
            var start = CFAbsoluteTimeGetCurrent()
            for i in 0..<testCount {
                queue.enqueue((i, i))
            }
            var elapsed = CFAbsoluteTimeGetCurrent() - start
            print("  - Enqueue 시간: \(String(format: "%.4f", elapsed))초")
            
            start = CFAbsoluteTimeGetCurrent()
            while !queue.isEmpty {
                _ = queue.dequeue()
            }
            elapsed = CFAbsoluteTimeGetCurrent() - start
            print("  - Dequeue 시간: \(String(format: "%.4f", elapsed))초")
            
        case .doubleStack:
            struct DoubleStackQueue<T> {
                private var inbox: [T] = []
                private var outbox: [T] = []
                
                var isEmpty: Bool {
                    inbox.isEmpty && outbox.isEmpty
                }
                
                mutating func enqueue(_ element: T) {
                    inbox.append(element)
                }
                
                mutating func dequeue() -> T? {
                    if outbox.isEmpty {
                        outbox = inbox.reversed()
                        inbox.removeAll()
                    }
                    return outbox.popLast()
                }
            }
            
            var queue = DoubleStackQueue<(Int, Int)>()
            
            var start = CFAbsoluteTimeGetCurrent()
            for i in 0..<testCount {
                queue.enqueue((i, i))
            }
            var elapsed = CFAbsoluteTimeGetCurrent() - start
            print("  - Enqueue 시간: \(String(format: "%.4f", elapsed))초")
            
            start = CFAbsoluteTimeGetCurrent()
            while !queue.isEmpty {
                _ = queue.dequeue()
            }
            elapsed = CFAbsoluteTimeGetCurrent() - start
            print("  - Dequeue 시간: \(String(format: "%.4f", elapsed))초")
        }
    }
    
    print("\n✅ 큐 성능 테스트 완료!")
    
}

@main
struct Main {
    static func main() {
        runQueuePerformanceTest()
    }
}
