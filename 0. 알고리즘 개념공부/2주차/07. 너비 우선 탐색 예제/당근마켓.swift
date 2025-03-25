//
//  당근마켓.swift
//  Algorithm
//
//  Created by 김동현 on 3/26/25.
//

import Foundation

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

@main
struct Main {
    static func main() {
        freopen("input.txt", "r", stdin)
        
        let dy: [Int] = [-1, 0, 1, 0]
        let dx: [Int] = [0, 1, 0, -1]

        var input = readLine()!.split(separator: " ").map { Int($0)! }
        let n = input[0]
        let m = input[1]
        
        input = readLine()!.split(separator: " ").map { Int($0)! }
        let sy = input[0]
        let sx = input[1]
        
        input = readLine()!.split(separator: " ").map { Int($0)! }
        let ey = input[0]
        let ex = input[1]
        
        // 격자
        //var a: [[Int]] = []
        var a: [[Int]] =  Array(repeating: Array(repeating: 0, count: m), count: n)
        
        // 방문 배열
        var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for i in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int($0)! }
            //a.append(row)
            a[i] = row
        }
        
        var queue = Queue<(Int, Int)>()
        visited[sy][sx] = 1
        queue.enqueue((sy, sx))
        
        while let (y, x) = queue.dequeue() {
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if ny<0 || ny>=n || nx<0 || nx>=m || a[ny][nx] == 0 {
                    continue
                }
                
                // 값이 0이 아닐경우
                if visited[ny][nx] != 0 { continue }
                
                visited[ny][nx] = visited[y][x] + 1
                queue.enqueue((ny, nx))
            }
        }
        print(visited[ey][ex])
        
    }
}


