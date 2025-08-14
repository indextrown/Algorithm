//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/14/25.
//

//import Foundation
//freopen("input.txt", "r", stdin)
//
//// 프로세스 종료 또는 I/O일 때 cpu 교체 발생
//// cpu를 다른 프로세스에 할당해야할 떄 현재 I/O를 하지 않는 프로세스 중에서 프로세스 번호가 가장 낮은 것에 CPU할당
//
//struct Process {
//    var cpuTime: Int = 0
//    var ioTime: Int = 0
//    var state: State
//    
//    enum State {
//        case running
//        case io
//        case stopped
//    }
//}
//
//let input = Int(readLine()!)!
//var processes: [[Process]] = []
//var processNum: Int = 0
//
//for _ in 0..<input {
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
//var cpuTime: Int = 0
//var ioTime: Int = 0
//
//while !processes.isEmpty {
//
//    let first = processes[processNum].removeFirst()
//
//    if first.state == .running {
//        cpuTime += first.cpuTime
//    }
//    else if first.state == .io {
//        ioTime += first.ioTime
//    }
//    
//    // 다른 프로세스 중에서 프로세스 번호가 낮은 cpu로 이동
//    for i in 0..<input where i != processNum {
//        if processes[i].first?.state == .running {
//            print("프로세스. \(i)로 이동")
//            processNum = i
//            break
//        }
//    }
//}
//
//
//print(processNum)
//print(cpuTime)
//print(ioTime)
