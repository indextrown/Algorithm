//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/26/25.
//

import Foundation

struct Point: Hashable {
    var y: Int
    var x: Int
    
    static func < (lhs: Point, rhs: Point) -> Bool {
        // total order
        return (lhs.y, lhs.x) < (rhs.y, rhs.x)
    }
}

struct Path: Hashable {
    let from: Point
    let to: Point
    
    init(from: Point, to: Point) {
        if from < to {
            self.from = from
            self.to = to
        } else {
            self.from = to
            self.to = from
        }
    }
}

func solution(_ dirs:String) -> Int {
    
    let driMap: [Character: Point] = [
        "U": Point(y: 0, x: -1),
        "D": Point(y: 0, x: 1),
        "L": Point(y: -1, x: 0),
        "R": Point(y: 1, x: 0)
    ]
    
    // 점이 아니라 선분을 저장해야 함
    var visited = Set<(Path)>()
    var start = Point(y: 5, x: 5)

    var ret = 0
    for cmd in dirs {
        let ny = start.y + driMap[cmd]!.y
        let nx = start.x + driMap[cmd]!.x
        let next = Point(y: ny, x: nx)
        
        // 영역 벗어나면 아웃
        if (next.y < 0 || next.y > 10 || next.x < 0 || next.x > 10) { continue }
        
        // 선분을 처음 지난다면 카운팅 하고 방문기록에 추가
        let path = Path(from: start, to: next)
        if !visited.contains(path) {
            visited.insert(path)
            ret += 1
        }
        start = next
    }
    let result = ret
    return result
}
