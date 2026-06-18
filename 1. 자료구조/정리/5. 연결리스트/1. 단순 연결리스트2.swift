//
//  1. 단순 연결리스트2.swift
//  Algorithm
//
//  Created by 김동현 on 8/12/25.
//
/*
 - https://velog.io/@newon-seoul/Swift자료구조-LinkedList-1편-Node-와-LinkedList-에-추가하기
 - https://jeonyeohun.tistory.com/320
 */

final class Node<T> {
    var data: T
    var next: Node?
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        let me = "\(data)"
        guard let next = next else { return me }
        return "\(me) -> \(next)"
    }
}

final class LinkedList<T: Equatable>: CustomStringConvertible {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var size: Int = 0  // ✅ 카운트 캐싱
    var description: String { head.map { "\($0)" } ?? "Empty list" }
    
    /// O(1) - 리스트가 비어있는지 여부 반환
    var isEmpty: Bool { head == nil }
    
    /// O(1) - 노드 개수 반환
    var count: Int { size }
    
    /// O(1) - 마지막에 데이터 추가
    func append(data: T) {
        let node = Node(data: data)
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
        size += 1 // ✅ 추가 시 카운트 증가
    }
    
    /// O(n) - 특정 위치에 데이터 삽입
    @discardableResult
    func insert(data: T, at index: Int) -> Bool {
        if head == nil || index <= 0 {
            head = Node(data: data, next: head)
            if tail == nil { tail = head }
            size += 1
            return true
        }
        var node = head
        for _ in 0..<(index-1) {
            if node?.next == nil { break }
            node = node?.next
        }
        let nextNode = node?.next
        node?.next = Node(data: data, next: nextNode)
        if nextNode == nil { tail = node?.next }
        size += 1
        return true
    }
    
    /// O(n) - 마지막 노드 삭제
    @discardableResult
    func removeLast() -> Bool {
        guard let h = head else { return false }
        if h.next == nil {
            head = nil
            tail = nil
            size = 0
            return true
        }
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        node?.next = nil
        tail = node
        size -= 1
        return true
    }
    
    /// O(n) - 특정 위치 노드 삭제
    @discardableResult
    func remove(at index: Int) -> Bool {
        guard head != nil else { return false }
        if index <= 0 || head?.next == nil {
            head = head?.next
            if head == nil { tail = nil }
            size -= 1
            return true
        }
        var node = head
        for _ in 0..<(index-1) {
            if node?.next?.next == nil { break }
            node = node?.next
        }
        if node?.next == nil { return false }
        if node?.next?.next == nil { tail = node }
        node?.next = node?.next?.next
        size -= 1
        return true
    }
    
    /// O(n) - 특정 데이터 탐색
    func searchNode(from data: T) -> Node<T>? {
        var node = head
        while let n = node {
            if n.data == data { return n }
            node = n.next
        }
        return nil
    }
    
    /// O(1) - 모든 노드 삭제
    func clear() {
        head = nil
        tail = nil
        size = 0
    }
    
    /// O(n) - 리스트를 배열로 변환
    func toArray() -> [T] {
        var arr: [T] = []
        var node = head
        while let n = node {
            arr.append(n.data)
            node = n.next
        }
        return arr
    }
}


@main
struct Main {
    static func main() {
        let list = LinkedList<Int>()
        
        // Append 테스트
        list.append(data: 1)
        list.append(data: 2)
        list.append(data: 3)
        print("After append: \(list)") // 1 -> 2 -> 3
        
        // Insert 테스트
        list.insert(data: 0, at: 0)
        list.insert(data: 4, at: 10)
        print("After insert: \(list)") // 0 -> 1 -> 2 -> 3 -> 4
        
        // Remove 테스트
        list.remove(at: 0)
        list.removeLast()
        print("After remove: \(list)") // 1 -> 2 -> 3
        
        // Search 테스트
        if let node = list.searchNode(from: 2) {
            print("Found node: \(node.data)") // Found node: 2
        }
        
        // 상태 테스트
        print("isEmpty:", list.isEmpty) // false
        print("count:", list.count)     // 3
        
        // Array 변환 테스트
        print("toArray:", list.toArray()) // [1, 2, 3]
        
        // Clear 테스트
        list.clear()
        print("After clear: \(list)")   // Empty list
        print("isEmpty:", list.isEmpty) // true
    }
}
