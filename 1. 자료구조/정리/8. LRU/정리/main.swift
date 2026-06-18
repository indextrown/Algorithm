//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 3/17/26.
//

/*
https://j2wooooo.tistory.com/121
https://gymdev.tistory.com/60
https://haningya.tistory.com/386

LRU
- 가장 오랫동안 참조되지 않은 페이지를 교체하는 알고리즘
- 단점: 프로세스가 주기억장치에 접근할 때마다 참조된 페이지에 대한 시간을 기록해야함(오버헤드)

로직
- 캐시에 공간이 있으면 가장 최근에 방문한 페이지가 캐시의 가장 최근 값으로 등록된다
- 캐시에 참조되는 페이지가 있으면 해당 페이지를 캐시의 가장 최근 값으로 등록한다
- 캐시에 참조하는 페이지가 없으면 해당 페이지를 캐시의 가장 최근 값으로 등록하고, 캐시에 있는 페이지중 가장 오랫동안 방문하지 않은 페이지를 제거한다

ex) 캐시크기 4
123145 순서로 페이지 방문

[1, 0, 0, 0]
[2, 1, 0, 0]
[3, 2, 1, 0]
[1, 3, 2, 0] 
[4, 1, 3, 2] 
[5, 4, 1, 3]

123145

규칙
1. 데이터 사용(get / put)시 무조건 최신 위치로 이동
2. 새로운 데이터 추가시 최신 위치로 이동
3. 데이터 꽉차면 오래된 데이터 제거

[개념]
dict (빠른 조회) + linked list (순서 관리)


*/
import Foundation

final class LRUCache<Key: Hashable, Value> {

    // Node
    final class Node {
        let key: Key
        var value: Value
        var prev: Node?
        var next: Node?

        init(key: Key, value: Value) {
            self.key = key
            self.value = value
        }
    }

    // Properties
    private var capacity: Int
    private var dict: [Key: Node] = [:]
    private var head: Node? // 가장 최근
    private var tail: Node? // 가장 오래됨

    init(capacity: Int) {
        self.capacity = capacity
    }

    // Get - 값조회 / 최근 사용으로 업데이트
    func get(_ key: Key) -> Value? {
        guard let node = dict[key] else { return nil }
        moveToHead(node)
        return node.value
    }

    // Put - 새 데이터면 데이터 추가 / 기존 데이터면 업데이트 / 최근 사용으로 업데이트 / 용량 초과시 가장 오래된 것 제거
    func put(_ key: Key, _ value: Value) {
        if let node = dict[key] {
            node.value = value
            moveToHead(node)
        } else {
            let newNode = Node(key: key, value: value)
            dict[key] = newNode
            addToHead(newNode)

            if dict.count > capacity {
                removeTail()
            }
        }
    }
}

extension LRUCache where Key == Value {
    func put(_ value: Key) {
        put(value, value)
    }
}

private extension LRUCache {
    // node를 가장 최근 위치로 추가
    func addToHead(_ node: Node) {
        node.next = head
        node.prev = nil

        head?.prev = node
        head = node

        // 처음 삽입
        if tail == nil {
            tail = node
        }
    }

    // 특정 노드를 리스트에서 제거
    private func removeNode(_ node: Node) {
        let prev = node.prev
        let next = node.next

        prev?.next = next
        next?.prev = prev

        if node === head {
            head = next
        }

        if node === tail {
            tail = prev
        }
    }

    // 이미 있는 노드를 최신 위치로 이동
    private func moveToHead(_ node: Node) {
        removeNode(node)
        addToHead(node)
    }

    // 캐시 용량 초가 시 / 가장 오래된 데이터 제거
    private func removeTail() {
        guard let tail = tail else { return }
        dict.removeValue(forKey: tail.key)
        removeNode(tail)
    }
}

extension LRUCache {
    func debugPrint() {
        var node = head
        var result: [Key] = []
        
        while let current = node {
            result.append(current.key)
            node = current.next
        }
        
        print(result)
    }
}


let cache = LRUCache<Int, Int>(capacity: 4)

[1,2,3,1,4,5].forEach {
    cache.put($0)
    cache.debugPrint()
}

print("\n===== Key / Value LRU =====")

let userCache = LRUCache<String, String>(capacity: 2)

// 데이터 저장
userCache.put("user1", "Alice")
userCache.debugPrint()

userCache.put("user2", "Bob")
userCache.debugPrint()

// 조회 (user1 사용 → 최신으로 이동)
print("get user1:", userCache.get("user1") ?? "nil")
userCache.debugPrint()

// 새로운 데이터 추가 (capacity 초과 → 가장 오래된 user2 제거)
userCache.put("user3", "Charlie")
userCache.debugPrint()

// 확인
print("get user2:", userCache.get("user2") ?? "nil") // nil (삭제됨)
print("get user3:", userCache.get("user3") ?? "nil") // Charlie