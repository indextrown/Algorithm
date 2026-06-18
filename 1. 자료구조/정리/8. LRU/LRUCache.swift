import Foundation

final class LRUCache {
    final class Node {
        var prev: Node?
        var next: Node?
        let key: Int
        var value: Int   

        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var cache: [Int: Node] = [:]

    private let head: Node
    private let tail: Node

    init(_ capacity: Int) {
        self.capacity = capacity
        self.head = Node(key: -1, value: -1)
        self.tail = Node(key: -1, value: -1)

        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        guard let node = cache[key] else {
            return -1
        }
        remove(node)
        addToFront(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let existingNode = cache[key] {
            existingNode.value = value
            remove(existingNode)
            addToFront(existingNode)
            return
        }

        let newNode = Node(key: key, value: value)
        cache[key] = newNode
        addToFront(newNode)

        if cache.count > capacity, let lruNode = tail.prev, lruNode !== head {
            cache.removeValue(forKey: lruNode.key)
            remove(lruNode)
        }
    }

    func currentCache() -> [(key: Int, value: Int)] {
        var result: [(key: Int, value: Int)] = []
        var current = head.next

        while let node = current, node !== tail {
            result.append((node.key, node.value))
            current = node.next
        }
        return result
    }

    private func addToFront(_ node: Node) {
        let first = head.next
        head.next = node
        node.prev = head
        node.next = first
        first?.prev = node
    }

    private func remove(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
        node.prev = nil
        node.next = nil
    }
}

let cache = LRUCache(3)

cache.put(1, 100)
cache.put(2, 200)
cache.put(3, 300)
print(cache.currentCache())   // [(3, 300), (2, 200), (1, 100)]

print(cache.get(2))           // 200
print(cache.currentCache())   // [(2, 200), (3, 300), (1, 100)]

cache.put(4, 400)
print(cache.currentCache())   // [(4, 400), (2, 200), (3, 300)]