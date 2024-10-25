//
//  queue.swift
//  Algorithm
//
//  Created by 김동현 on 8/12/24.
//

// https://velog.io/@gundy/Swift-Swift에서-Queue는-뭘로-구현해야-할까\
// https://babbab2.tistory.com/84
// https://jeong9216.tistory.com/350

// https://velog.io/@mazorika/Swift-Queue-만들기-BOJ-18258
// https://seons-dev.tistory.com/entry/Swift-DispatchQueue란-GCD-Grand-Central-Dispatch#google_vignette
// https://velog.io/@gundy/Swift-Swift에서-Queue는-뭘로-구현해야-할까
import Foundation


struct Queue<T> {
    // 빈 Array 선언
    private var queue: [T] = []
    
    // Queue 내 원소 개수
    public var count: Int {
        return queue.count
    }
    
    // Queue가 비었는지
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    // 삽입
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    // 삭제
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    // Queue요소 전체 삭제
    public mutating func clear() {
        queue.removeAll()
    }
}



@main
struct Main {
    static func main() {
        var q = Queue<Int>()
        q.enqueue(10)
        q.enqueue(20)
        q.enqueue(30)
        print(q.count)
        print(q.dequeue()!)
    }
}


