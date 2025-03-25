//
//  2. heap.swift
//  Algorithm
//
//  Created by 김동현 on 3/4/25.
//

/*
 heap
 - 완전이진트리를 사용한 자료구조
 - 최솟값과 최댓값을 빠르게 찾기 위해 사용한다
 - 루트노드를 최댓값으로 사용하면 최대힙이되고, 최소값으로 사용하면 최소힙이 된다
 - https://dev-with-precious-dreams.tistory.com/155
 삽입
 - logn
 
 삭제
 - Logn
 */

public struct Heap<T> {
  var nodes: [T] = []
  let comparer: (T,T) -> Bool

  var isEmpty: Bool {
      return nodes.isEmpty
  }

  init(comparer: @escaping (T,T) -> Bool) {
      self.comparer = comparer
  }

  func peek() -> T? {
      return nodes.first
  }

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index], nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
      guard !nodes.isEmpty else {
          return nil
      }

      if nodes.count == 1 {
          return nodes.removeFirst()
      }

      let result = nodes.first
      nodes.swapAt(0, nodes.count-1)
      _ = nodes.popLast()

      var index = 0

      while index < nodes.count {
          let left = index * 2 + 1
          let right = left + 1

          if right < nodes.count {
              if comparer(nodes[left], nodes[right]),
                  !comparer(nodes[right], nodes[index]) {
                  nodes.swapAt(right, index)
                  index = right
              } else if !comparer(nodes[left], nodes[index]){
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else if left < nodes.count {
              if !comparer(nodes[left], nodes[index]) {
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else {
              break
          }
      }

      return result
  }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: <)
    }
}

@main
struct Main {
    static func main() {
        // MARK: - Max Heap (기본 확장 사용: T가 Comparable이면, comparer로 < 사용하여 max-heap 형식)
        var maxHeap = Heap<Int>()
        maxHeap.insert(10)
        maxHeap.insert(4)
        maxHeap.insert(15)
        maxHeap.insert(20)
        maxHeap.insert(0)
        
        print("Max Heap (최대 힙) 사용 예시:")
        if let peekValue = maxHeap.peek() {
            print("Peek (루트): \(peekValue)")
        }
        
        print("삭제하며 요소 출력:")
        while let element = maxHeap.delete() {
            print(element)
        }
        
        
        // MARK: - Min Heap (커스텀 comparer 사용: comparer를 >로 전달하면 min-heap 형식)
        var minHeap = Heap<Int>(comparer: >)
        minHeap.insert(10)
        minHeap.insert(4)
        minHeap.insert(15)
        minHeap.insert(20)
        minHeap.insert(0)
        
        print("\nMin Heap (최소 힙) 사용 예시:")
        if let peekValue = minHeap.peek() {
            print("Peek (루트): \(peekValue)")
        }
        
        print("삭제하며 요소 출력:")
        while let element = minHeap.delete() {
            print(element)
        }
    }
}
