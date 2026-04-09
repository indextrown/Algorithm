import Foundation

// pageMap: 특정 페이지가 캐시에 있는지 빠르게 찾기
// 이중 연결 리스트(Node): 어떤 페이지가 가장 최근/가장 오래 사용됐는지 순서 관리
// 앞쪽: 가장 최근 사용
// 뒤쪽: 가장 오래 사용
final class PageLRU {
    final class Node {
        var prev: Node?
        var next: Node?
        let page: Int

        init(page: Int) {
            self.page = page
        }
    }

    private let capacity: Int
    private var count: Int = 0
    private var pageMap: [Int: Node] = [:]

    private let head: Node
    private let tail: Node

    init(capacity: Int) {
        self.capacity = capacity
        self.head = Node(page: -1) // dummy node
        self.tail = Node(page: -1) // dummy node
        head.next = tail
        head.prev = head
    }

    /// 페이지를 참조한다.
    /// - 이미 있으면: 기존 위치에서 빼고 맨 앞으로 이동 (hit)
    /// - 없으면: 새로 추가 (miss)
    func refer(_ page: Int) {
        if let node = pageMap[page] { 
            remove(node)
            addToFront(node)
            print("refer(\(page)) -> hit")
        } else {
            let newNode = Node(page: page)  // 새 노드 생성
            pageMap[page] = newNode         // 딕셔너리에 저장
            addToFront(newNode)             // 맨 앞으로 삽입
            count += 1                      // 개수 증기
            print("refer(\(page)) -> miss")

            // 용량 초과 시 가장 오래 사용하지 않은 페이지를 제거
            // 가장 최근 사용: head 바로 뒤
            // 가장 오래 사용: tail 바로 앞
            if count > capacity, let lruNode = tail.prev, lruNode !== head {
                pageMap.removeValue(forKey: lruNode.page)
                remove(lruNode)
                count -= 1
            }
        }
    }

    // 현재 캐시에 있는 페이지를 순서대로 반환
    func currentPages() -> [Int] {
        var result: [Int] = []
        var current = head.next

        while let node = current, node !== tail {
            result.append(node.page)
            current = node.next
        }
        return result
    }

    // head뒤에 삽입
    private func addToFront(_ node: Node) {
        let first = head.next
        head.next = node
        node.prev = head
        node.next = first
        first?.prev = node
    }

    // 현재 위치에서 노드 제거
    private func remove(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
        node.prev = nil
        node.next = nil
    }
}

/*
refer(1) -> miss
[1]
refer(2) -> miss
[2, 1]
refer(1) -> hit
[1, 2]
refer(3) -> miss
[3, 1, 2]
refer(4) -> miss
[4, 3, 1]
refer(1) -> hit
[1, 4, 3]
refer(5) -> miss
[5, 1, 4]
refer(4) -> hit
[4, 5, 1]
*/
let pageLRU = PageLRU(capacity: 3)
[1, 2, 1, 3, 4, 1, 5, 4].forEach {
    pageLRU.refer($0)
    print(pageLRU.currentPages())
}