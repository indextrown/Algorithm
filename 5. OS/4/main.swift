//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 9/3/25.
//

import Foundation
freopen("input.txt", "r", stdin)

struct Process {
    var remainingTime: Int = 0
    var state: State
    
    enum State {
        case cpuTime
        case ioTime
    }
}

// MARK: - Input
let n = Int(readLine()!)!
var queues: [[Process]] = []

for _ in 0..<n {
    var process: [Process] = []
    let queue = Array(readLine()!.split(separator: " ").map { Int($0)! }.dropLast())
    
    for (i, j) in queue.enumerated() {
        if i % 2 == 0 {
            process.append(Process(remainingTime: j, state: .cpuTime))
        } else {
            process.append(Process(remainingTime: j, state: .ioTime))
        }
    }
    
    queues.append(process)
}

// MARK: - Logic
print(queues.map { $0.map { ($0.remainingTime, $0.state) } })




