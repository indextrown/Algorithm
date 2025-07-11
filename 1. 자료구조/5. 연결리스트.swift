//
//  5. 연결리스트.swift
//  Algorithm
//
//  Created by 김동현 on 7/12/25.
//
// https://babbab2.tistory.com/86

import Foundation


class Node<T> {
    var data: T
    var next: Node? // 연결 리스트의 마지막 노드는 next가 nil이다
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T: Equatable> {
    private var head: Node<T>? // 처음에는 노드가 없기 때문에 nil이다
    
    // 연결 리스트 맨 마지막에 노드 추가하기
    func append(data: T) {
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        
        // 마지막 노드의 next에 새 노드를 연결
        node?.next = Node(data: data)
    }
    
    // 연결 리스트 중간에 노드 추가하기
    func insert(data: T, index: Int) {
        // head가 없는 경우 Node를 생성 후 head로 지정
        if head == nil {
            head = Node(data: data)
            return
        }
        
        if index == 0 {
            head = Node(data: data, next: head)
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next == nil { break }
            node = node?.next
        }
        
        let nextNode = node?.next
        node?.next = Node(data: data)
        node?.next?.next = nextNode
    }
    
    // 연결 리스트 맨 마지막 노드 삭제하기
    func removeLast() {
        if head == nil { return }
        
        // head 삭제하는 경우
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        
        node?.next = node?.next?.next
    }
    
    // 연결 리스트 중간 노드 삭제하기
    func remove(index: Int) {
        if head == nil { return }
        
        // head를 삭제하는 경우
        if index == 0 || head?.next == nil {
            head = head?.next
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next?.next == nil { break }
            node = node?.next
        }
        node?.next = node?.next?.next
    }
    
    // data로 노드 찾기
    func searchNode(data: T?) -> Node<T>? {
        if head == nil { return nil }
        
        var node = head
        while let current = node {
            if current.data == data {
                return current
            }
            node = current.next
        }
        return nil
    }
    
}

@main
struct Main {
    static func main() {
        let list = LinkedList<String>()

        // ✅ 1. append(data:) - 맨 끝에 추가
        list.append(data: "A") // head가 nil → 바로 추가됨 (O(1))
        list.append(data: "B") // head부터 끝까지 순회 후 추가 (O(n))
        list.append(data: "C") // head부터 끝까지 순회 후 추가 (O(n))
        // 현재 상태: A → B → C

        // ✅ 2. insert(data:index:) - 중간 삽입
        list.insert(data: "X", index: 1) // B 앞에 삽입됨 → A → X → B → C (O(index))
        // - index까지 순회(O(index)) + 삽입은 포인터만 교체(O(1))

        // ✅ 3. insert at head
        list.insert(data: "Y", index: 0) // head 자리에 삽입됨 → Y → A → X → B → C (O(1))

        // ✅ 4. removeLast() - 마지막 노드 제거
        list.removeLast() // 마지막 "C" 삭제 → Y → A → X → B (O(n))
        // - 마지막에서 두 번째 노드까지 순회 필요

        // ✅ 5. remove(index:) - 중간 삭제
        list.remove(index: 2) // "X" 삭제 → Y → A → B (O(index))
        // - index까지 순회 후 포인터 조정

        // ✅ 6. searchNode(data:) - 값으로 노드 탐색
        if let found = list.searchNode(data: "A") { // head부터 순회 (O(n))
            print("✅ Found node: \(found.data)")    // 출력: A
        } else {
            print("❌ Node not found")
        }

        if let found = list.searchNode(data: "Z") {
            print("✅ Found node: \(found.data)")
        } else {
            print("❌ Node not found")               // 출력: Node not found
        }
    }
}
