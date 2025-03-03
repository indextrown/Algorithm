//
//  queue.swift
//  Algorithm
//
//  Created by 김동현 on 2/22/25.
//

// https://velog.io/@gundy/Swift-Swift에서-Queue는-뭘로-구현해야-할까

import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    var size: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        // 평균 O(1) - 그러나, 내부 배열의 크기를 늘려야 할 경우(즉, 배열이 꽉 찼을 경우), 재할당이 발생하면서 **O(n)**의 시간이 걸릴 수도 있음.
        queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        // O(n)
        return isEmpty ? nil : queue.removeFirst()
    }
}

struct DoubleStackQueue<T> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var size: Int {
        return enqueueStack.count + dequeueStack.count
    }
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)               // O(1)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed() // O{n}
            enqueueStack.removeAll()               // O(1)
        }
        return dequeueStack.popLast()              // O(1)
    }

    
    /*
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            while !enqueueStack.isEmpty {
                dequeueStack.append(enqueueStack.removeLast()) // O(n), 가끔만 발생
            }
        }
        return dequeueStack.popLast() // O(1)
    }
     */
    
    /*
    mutating func dequeue() -> T? {
        if dequeueStack.isEmpty {
            // ✅ `enqueueStack`의 일부만 `dequeueStack`으로 이동하여 속도 개선
            let transferCount = min(enqueueStack.count, 1000) // 한 번에 1000개만 이동
            while dequeueStack.count < transferCount, !enqueueStack.isEmpty {
                dequeueStack.append(enqueueStack.removeLast())
            }
        }
        return dequeueStack.popLast()  // O(1)
    }
     */
}


@main
struct Main {
    static func main() {
        var queue = DoubleStackQueue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
//        while !queue.isEmpty {
//            print("\(queue.dequeue()!)")
//        }
        
        
        while let element = queue.dequeue() {
            print(element)
        }
    }
}



//@main
//struct Main {
//    static func main() {
//        let times = 1_000_000 // 100만 개 삽입
//        var myQueue = DoubleStackQueue<Int>()
//
//        // 🔹 Enqueue 시간 측정
//        var startTime = CFAbsoluteTimeGetCurrent()
//        for i in 1...times {
//            myQueue.enqueue(i) // ✅ 변수명 수정
//        }
//        var durationTime = CFAbsoluteTimeGetCurrent() - startTime
//        print("DoubleStackQueue enqueue time: \(durationTime) seconds")
//
//        // 🔹 Dequeue 시간 측정
//        startTime = CFAbsoluteTimeGetCurrent()
//        for _ in 1...times {
//            myQueue.dequeue() // ✅ 변수명 수정
//        }
//        durationTime = CFAbsoluteTimeGetCurrent() - startTime
//        print("DoubleStackQueue dequeue time: \(durationTime) seconds\n")
//    }
//}
