//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/8/25.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var count: Int = 0
    var bucket: [Int] = []
    var stacks: [[Int]] = Array(repeating: [], count: board.count)
    
    board.reversed().forEach {
        $0.enumerated().forEach {
            if $0.1 != 0 {
                stacks[$0.0].append($0.1)
            }
        }
    }
    
    moves.forEach {
        if let doll = stacks[$0-1].popLast() {
            if let last = bucket.last, last == doll {
                bucket.removeLast(1)
                count += 2
            } else {
                bucket.append(doll)
            }
        }
    }
    
    return count
}


let board: [[Int]] = [
    [0, 0, 0, 0, 0],
    [0, 0, 1, 0, 3],
    [0, 2, 5, 0, 1],
    [4, 2, 4, 4, 2],
    [3, 5, 1, 3, 1]
]

let moves: [Int] = [1, 5, 3, 5, 1, 2, 1, 4]
print(solution(board, moves))

/*
import Foundation

let size = 500
let board: [[Int]] = (0..<size).map { _ in
    (0..<size).map { _ in Int.random(in: 0...5) }
}

// MARK: - forEach 방식
func setupStacksWithForEach(_ board: [[Int]]) -> [[Int]] {
    var stacks = Array(repeating: [Int](), count: board.count)

    board.reversed().forEach {
        $0.enumerated().forEach {
            if $0.1 != 0 {
                stacks[$0.0].append($0.1)
            }
        }
    }

    return stacks
}

// MARK: - for-in 방식
func setupStacksWithForIn(_ board: [[Int]]) -> [[Int]] {
    var stacks = Array(repeating: [Int](), count: board.count)

    for row in board.reversed() {
        for (col, doll) in row.enumerated() {
            if doll != 0 {
                stacks[col].append(doll)
            }
        }
    }

    return stacks
}

// MARK: - 시간 측정 함수
func measureExecutionTime(name: String, block: () -> Void) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000
    print("\(name) 실행 시간: \(timeInterval)ms")
}

// MARK: - 실행
measureExecutionTime(name: "forEach") {
    _ = setupStacksWithForEach(board)
}

measureExecutionTime(name: "for-in") {
    _ = setupStacksWithForIn(board)
}
*/
