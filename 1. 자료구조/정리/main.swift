//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/2/26.
//

import Foundation

//freopen("input.txt", "r", stdin)
//
//var arr = Array(repeating: 0, count: 9)
//for i in 0..<9 {
//    arr[i] = Int(readLine()!)!
//}
//
//print(arr)

/**
 순열
 - **순서와 상관있다**
 - 순서가 정해진 임의의 집합을 다른 순서로 섞는 연산을의미한다
 - 1, 2, 3과 1, 3, 2 는 다르게 취급한다
 - n개의 집합 중 n개를 고르는 순열의 개수는 n!이다
 - 3개의 자연수 (1, 2, 3)을 이용해 만들 수 있는 3자리 자연수는 6개다
 - 3개 중 3개를 뽑는 경우 3! 3개 중 1개를 뽑는 경우 3
 - nPr
 */

//func makePermutation(arr: inout: [Int], n: Int, r: Int, depth: Int) {
//    if depth == r {
//        
//    }
//}





struct Queue<T> {
    private var array: [T] = []
    private var index: Int = 0
    
    var isEmpty: Bool {
        return array.count - index <= 0
    }
    
    var top: T? {
        return isEmpty ? nil : array[index]
    }
    
    var count: Int {
        return array.count - index
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        guard !self.isEmpty else { return nil }
        
        let element = array[index]
        index += 1
        return element
    }
}

struct DoubleStackQueue<T> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    var count: Int {
        return enqueueStack.count + dequeueStack.count
    }
    
    var top: T? {
        if let last = dequeueStack.last {
            return last
        }
        return enqueueStack.first
    }
    
    mutating func push(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}


//var queue = Queue<Int>()
//queue.push(1)
//queue.push(2)
//queue.push(3)
//
//print(queue.pop() ?? 0)
//
//while let element = queue.pop() {
//    print(element)
//}


let runner = BenchmarkRunner(
    Benchmark(name: "IndexQueue") {
        var queue = Queue<Int>()
        return {
            for i in 0..<100_000 {
                queue.push(i)
            }
            for i in 0..<100_000 {
                queue.pop()
            }
        }
    },
    Benchmark(name: "DoubleStackQueue") {
        var queue = DoubleStackQueue<Int>()
        return {
            for i in 0..<100_000 {
                queue.push(i)
            }
            for i in 0..<100_000 {
                queue.pop()
            }
        }
    }
)
runner.run()

