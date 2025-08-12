//
//  performance.swift
//  Algorithm
//
//  Created by 김동현 on 8/12/25.
//

import Foundation

// --------- Utils ----------
@inline(__always)
func measure(_ runs: Int = 3, _ work: () -> Void) -> Double {
    var total: Double = 0
    for _ in 0..<runs {
        let t0 = CFAbsoluteTimeGetCurrent()
        work()
        total += (CFAbsoluteTimeGetCurrent() - t0)
    }
    return (total / Double(runs)) * 1000.0 // ms
}

// --------- Impl #1: index + remove(at:) ----------
func josephusIndex(n: Int, k: Int) -> [Int] {
    var circle = Array(1...n)
    var removed: [Int] = []
    var idx = 0
    removed.reserveCapacity(n)

    while !circle.isEmpty {
        idx = (idx + k - 1) % circle.count
        removed.append(circle.remove(at: idx)) // O(n) 이동
    }
    return removed
}

// --------- Impl #2: Queue(두-스택) 회전 ----------
struct Queue<T> {
    private var inStack: [T] = []
    private var outStack: [T] = []
    var isEmpty: Bool { inStack.isEmpty && outStack.isEmpty }

    mutating func enqueue(_ x: T) { inStack.append(x) }
    mutating func dequeue() -> T? {
        if outStack.isEmpty {
            outStack = inStack.reversed()
            inStack.removeAll(keepingCapacity: true)
        }
        return outStack.popLast()
    }
}

func josephusQueue(n: Int, k: Int) -> [Int] {
    var q = Queue<Int>()
    for i in 1...n { q.enqueue(i) }
    var removed: [Int] = []
    removed.reserveCapacity(n)

    while !q.isEmpty {
        // k-1번 회전: O(1) dequeue+enqueue를 (k-1)번
        for _ in 0..<(k - 1) {
            if let x = q.dequeue() { q.enqueue(x) }
        }
        if let x = q.dequeue() {
            removed.append(x)
        }
    }
    return removed
}

@main
struct Main {
    static func main() {
        // --------- Benchmark ----------
        let ns = [1_000, 5_000, 10_000, 100_000]       // 필요하면 50_000, 100_000 등으로 확장
        let ks = [2, 7, 37]                   // k가 커질수록 회전 방식이 불리해짐

        for n in ns {
            for k in ks {
                let tIndex = measure(3) {
                    _ = josephusIndex(n: n, k: k)
                }
                let tQueue = measure(3) {
                    _ = josephusQueue(n: n, k: k)
                }
                print(String(format: "n=%6d, k=%3d  |  index+remove: %7.2f ms  |  queue-rotate: %7.2f ms",
                             n, k, tIndex, tQueue))
            }
        }

    }
}
