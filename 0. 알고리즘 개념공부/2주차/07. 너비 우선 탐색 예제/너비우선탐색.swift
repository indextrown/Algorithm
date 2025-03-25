//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 3/25/25.
//

struct Queue<T> {
    private var enqueueStack: [T] = []
    private var dequeueStack: [T] = []
    
    var size: Int {
        return enqueueStack.count + dequeueStack.count
    }
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        // dequeueStack가 비어있다면, enqueueStack의 모든 요소를 뒤집어 deqeuueStack로 옮긴다
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}

var adj: [[Int]] = Array(repeating: [], count: 100)
var visited: [Int] = Array(repeating: 0, count: 100)
let nodeList: [Int] = [10, 12, 14, 16, 18, 20, 22, 24]

func bfs(_ element: Int) {
    var q = Queue<Int>()
    visited[element] = 1
    q.enqueue(element)
    
    while let here = q.dequeue() {
        for there in adj[here] {
            if visited[there] == 1 { continue }
            visited[there] = visited[here] + 1
            q.enqueue(there)
        }
    }
}

adj[10].append(12)
adj[10].append(14)
adj[10].append(16)

adj[12].append(18)
adj[12].append(20)

adj[20].append(22)
adj[20].append(24)

bfs(10)

for node in nodeList {
    print("\(node) : \(visited[node])")
}

print("10번부터 24번까지 최단거리는: \(visited[24]-1)")

