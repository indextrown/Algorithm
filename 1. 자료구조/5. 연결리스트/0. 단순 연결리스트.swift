//
//  연결리스트.swift
//  Algorithm
//
//  Created by 김동현 on 8/11/25.
//

/*
 [단방향 연결 리스트]
 - 연결리스트는 연속되지 않은 메모리에 저장된 데이터들을 연결시켜 놓은 것
 - 내 다음 순서 데이터의 주소값을 내가 가지고 있어야 한다
 - 노드[데이터, 다음 주소]
 - https://babbab2.tistory.com/86
 - https://tngusmiso.tistory.com/20
 - https://velog.io/@newon-seoul/Swift자료구조-LinkedList-1편-Node-와-LinkedList-에-추가하기
 
 */
import Foundation

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T? = nil, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

// print편의를 위한 코드
extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(data!)"
        }
        return "\(data!) -> " + String(describing: next) + " "
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

// search()에서 node?.data와 data를 비교할 때 제네릭 타입이라 자료를 런타입 전까지 모르기 때문에 Equatable를 채택하여 == 비교 가능하게 하자
class LinkedList<T:Equatable> {
    // 가장 첫 노드를 가리키는 프로퍼티
    private var head: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
    
    func append(data: T?) {
        // head가 없는 경우 Node 생성 후 head로 지정 후 종료
        if head == nil {
            head = Node(data: data)
            return
        }
        
        // 현재 리스트의 첫 노드부터 탐색 시작
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    func insert(data: T?, at index: Int) {
        // head가 없는 경우 Node 생성 후 head로 지정 후 종료
        if head == nil || index <= 0 {
            head = Node(data: data, next: head)
            return
        }
        
        // 삽입 위치 직전 노드까지 이동
        var node = head
        for _ in 0..<(index-1) {
            /// 만약 중간에 node?.next가 없으면 멈춘다
            if node?.next == nil { break }
            node = node?.next
        }
        
        // 삽입 위치에 원래 노드 저장
        let nextNode = node?.next     /// 기존 다음 노드를 임시 저장
        node?.next = Node(data: data) /// 기존 다음 노드를 끊고 새 노드 연결
        node?.next?.next = nextNode   /// 기존 노드를 새 노드 뒤로 연결
    }
    
    func removeLast() {
        if head == nil { return }
        
        // head를 삭제하는 경우
        if head?.next == nil {
            head = nil
            return
        }
        
        // 다음 노드가 존재하는 동안 이동(삭제할 노드 직전 노드까지 이동)
        var node = head
        while node?.next?.next != nil {
            node = node?.next
        }
        node?.next = nil // (= node?.next = node?.next?.next)
    }
    
    func remove(at index: Int) {
        if head == nil { return }
        
        // head를 삭제하는 경우
        if index <= 0 || head?.next == nil {
            head = head?.next
            return
        }
        
        // 삭제할 노드 직전 노드까지 이동
        var node = head
        for _ in 0..<(index-1) {
            if node?.next?.next == nil { break }
            node = node?.next
        }
        node?.next = node?.next?.next
    }
    
    func searchNode(from data: T?) -> Node<T>? {
        if head == nil { return nil }
        
        var node = head
        while node != nil {
            if node?.data == data { break }
            node = node?.next
        }
        return node
    }
}

@main
struct Main {
    static func main() {
        /*
        let node1 = Node(data: 1)
        let node2 = Node(data: 2)
        let node3 = Node(data: 3)
        node1.next = node2
        node2.next = node3
        let list = LinkedList(head: node1)
        print(list)
         */
    }
}



