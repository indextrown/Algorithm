//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/14/25.
//

import Foundation
freopen("input.txt", "r", stdin)

// 프로세스 종료 또는 I/O일 때 cpu 교체 발생
// cpu를 다른 프로세스에 할당해야할 떄 현재 I/O를 하지 않는 프로세스 중에서 프로세스 번호가 가장 낮은 것에 CPU할당
struct Process {
    var cpuTime: Int = 0
    var ioTime: Int = 0
    var state: State
    
    enum State {
        case running
        case io
    }
}

let program = Int(readLine()!)!
var processes: [[Process]] = []


for _ in 0..<program {
    var process: [Process] = []
    let queue = readLine()!.split(separator: " ").map { Int($0)! }
    
    for (i, j) in queue.enumerated() {
        if j == -1 { break }
        if i % 2 == 0 {
            process.append(Process(cpuTime: j, state: .running))
        } else {
            process.append(Process(ioTime: j, state: .io))
        }
    }
    processes.append(process)
}

var cpuTime: Int = 0
var ioTime: Int = 0
var currentProcess: Int = 0

/*
 [(2, 0), (0, 2), (3, 0), (0, 3), (3, 0)]
 [(1, 0), (0, 3), (1, 0), (0, 3), (2, 0)]
 [(2, 0), (0, 3), (2, 0)]
 */

while processes.contains(where: { !$0.isEmpty }) {
    guard let first = processes[currentProcess].first else {
        // 현재 프로세스가 비어있다면 다음 가능한 것으로 변경
        if let next = processes.enumerated().first(where: { !$0.element.isEmpty }) {
            currentProcess = next.offset
        }
        continue
    }
    
    
    switch first.state {
    case .running:
        cpuTime += first.cpuTime
        processes[currentProcess].removeFirst()
        
        // i/o 타임 감소
        for i in 0..<program where i != currentProcess {
            if processes[i].first?.state == .io {
                processes[i][0].ioTime = max(0, processes[i][0].ioTime - first.cpuTime)
                if processes[i][0].ioTime == 0 {
                    processes[i].removeFirst()
                }
            }

            if let io = processes[i].first, io.state == .io && io.ioTime == 0 {
                processes[i].remove(at: 0)
            }
        }
    case .io:
        ioTime += first.ioTime
        processes[currentProcess].removeFirst()
    }
    
    // 다음 실행 가능한 running 상태 프로세스로 이동
    var switched = false
    for i in 0..<program {
        if i != currentProcess, processes[i].first?.state == .running {
            print("프로세스. \(i)로 이동")
            currentProcess = i
            switched = true
            break
        }
    }

    // running 상태가 없다면 첫 번째 남은 프로세스로라도 이동
    if !switched {
        for i in 0..<program {
            if !processes[i].isEmpty {
                currentProcess = i
                break
            }
        }
    }
    
    
}

print("\(cpuTime)\n\(ioTime)")





