////
////  main.swift
////  Algorithm
////
////  Created by 김동현 on 8/16/25.
////
//
//import Foundation
//freopen("input.txt", "r", stdin)
//
//// 프로세스 종료 또는 I/O일 때 cpu 교체 발생
//// cpu를 다른 프로세스에 할당해야할 떄 현재 I/O를 하지 않는 프로세스 중에서 프로세스 번호가 가장 낮은 것에 CPU할당
//struct Process {
//    var cpuTime: Int = 0
//    var ioTime: Int = 0
//    var state: State
//    
//    enum State {
//        case running
//        case io
//    }
//}
//
//let program = Int(readLine()!)!
//var processes: [[Process]] = []
//
//for _ in 0..<program {
//    var process: [Process] = []
//    let queue = readLine()!.split(separator: " ").map { Int($0)! }
//    
//    for (i, j) in queue.enumerated() {
//        if j == -1 { break }
//        if i % 2 == 0 {
//            process.append(Process(cpuTime: j, state: .running))
//        } else {
//            process.append(Process(ioTime: j, state: .io))
//        }
//    }
//    processes.append(process)
//}
//
//var processNum: Int = 0
//var cpuTime: Int = 0
//var ioTime: Int = 0
//while processes.contains(where: { !$0.isEmpty }) {
//    // 비어있거나 I/O면 다른 프로세스로 이동
//    if processes[processNum].isEmpty {
//        let num = (processNum + 1) % program
//        processNum = num
//        print("프로세스 \(processNum)로 이동(디버깅)")
//        continue
//    }
//    
//    let first = processes[processNum].first!
//    switch first.state {
//    case .running:
//        print(first.cpuTime)
//        cpuTime += first.cpuTime
//        processes[processNum].removeFirst()
//        
//        // i/o 타임 감소
//        for i in 0..<program where i != processNum {
//            if processes[i].first?.state == .io {
//                processes[i][0].ioTime = max(0, processes[i][0].ioTime - first.cpuTime)
//                if processes[i][0].ioTime == 0 {
//                    processes[i].removeFirst()
//                }
//            }
//
//            if let io = processes[i].first, io.state == .io && io.ioTime == 0 {
//                processes[i].remove(at: 0)
//            }
//        }
//    case .io:
//        processes[processNum].removeFirst()
//    }
//    
//    for i in 0..<program {
//        if i != processNum, processes[i].first?.state == .running {
//            processNum = i
//            print("프로세스: \(i)로 이동")
//            break
//        }
//    }
//}
//print(cpuTime)
//

import Foundation
freopen("input.txt", "r", stdin)

struct Process {
    var cpuTime: Int = 0
    var ioTime: Int = 0
    var state: State
    enum State { case running, io }
}

let program = Int(readLine()!)!
var processes: [[Process]] = []

// 입력: 각 줄 "CPU IO CPU IO ... -1"
for _ in 0..<program {
    var line: [Process] = []
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    for (i, v) in nums.enumerated() {
        if v == -1 { break }
        if i % 2 == 0 { line.append(Process(cpuTime: v, ioTime: 0, state: .running)) }
        else          { line.append(Process(cpuTime: 0, ioTime: v, state: .io)) }
    }
    processes.append(line)
}

var cpuTimeSum = 0

func lowestReadyRunningIndex() -> Int? {
    (0..<program).first { !processes[$0].isEmpty && processes[$0][0].state == .running }
}

func minFrontIO() -> Int? {
    var m = Int.max
    for i in 0..<program {
        if !processes[i].isEmpty, processes[i][0].state == .io {
            m = min(m, processes[i][0].ioTime)
        }
    }
    return (m == Int.max) ? nil : m
}

while processes.contains(where: { !$0.isEmpty }) {

    if let idx = lowestReadyRunningIndex() {
        // 1) 전역에서 가장 번호 낮은 running 수행
        let burst = processes[idx].removeFirst()      // running 보장
        let run = burst.cpuTime
        cpuTimeSum += run

        // 2) 동시에 모든 선두 I/O를 run 만큼 진행 (초과 깎지 않음)
        for i in 0..<program where i != idx {
            if !processes[i].isEmpty, processes[i][0].state == .io {
                let left = processes[i][0].ioTime
                let dec  = min(left, run)             // 남은 시간만큼만 감소
                processes[i][0].ioTime = left - dec
                if processes[i][0].ioTime == 0 {
                    processes[i].removeFirst()        // I/O 완료 → 다음 버스트로
                }
            }
        }

    } else {
        // 3) 모두 I/O만 남음 → 가장 작은 I/O 시간만큼 '시간 전진'
        guard let step = minFrontIO() else { break }  // 안전 가드
        for i in 0..<program {
            if !processes[i].isEmpty, processes[i][0].state == .io {
                processes[i][0].ioTime -= step
                if processes[i][0].ioTime == 0 {
                    processes[i].removeFirst()
                }
            }
        }
        // cpuTimeSum은 증가하지 않음(유휴 구간)
    }
}

print(cpuTimeSum)
