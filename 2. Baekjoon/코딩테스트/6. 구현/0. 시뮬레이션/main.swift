// /*
// 현재 CPU를 사용중인 프로세스가 있으면 그 프로세스가 종료하거나 or I/O를 할 때만 CPU 교체가 일어난다.
// 파란 화살표: CPU 사용
// 빨간 화살표: I/O 사용

// [출력]
// cpu 유휴시간, 처리가 종료된 시각

// 3
// 2 2 3 3 3 -1
// 1 3 1 3 2 -1
// 2 3 2 -1
// */

import Foundation

freopen("input.txt", "r", stdin)

let n = Int(readLine()!)!

final class Process {
    var tasks: [Int] = []
    var ioFinishTime = 0    // 현재 io가 끝나는 시간(0이면 아직 io 안한 상태)
    var isFinished: Bool {  // 프로세스 종료 여부
        tasks.isEmpty
    }

    func canRun(at time: Int) -> Bool {
        !isFinished && ioFinishTime <= time
    }

    func runCPU(at currentTime: inout Int) {

        if let cpuTime = tasks.popLast() {
            currentTime += cpuTime
        }

        if let ioTime = tasks.popLast() {
            ioFinishTime = currentTime + ioTime
        }
    }
}

// input
var processes = (0..<n).map { _ in Process() }
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }.prefix { $0 != -1 }
    processes[i].tasks = Array(input.reversed())
}

var currentTime = 0 // 현재 시간
var idleTime = 0    // CPU가 놀고 있었던 시간

// 실행 가능할 프로세스 찾기
while processes.contains(where: { !$0.isFinished }) {
    // 실행 가능한 프로세스가 있다면
    if let process = processes.first(where: { $0.canRun(at: currentTime) }) {
        process.runCPU(at: &currentTime)
    } else {
        // 실행 가능한 게 없다면(모든 프로세스가 IO상태임) -> 가장 빨리 끝나는 IO 찾기
        let nextIOTime = processes
        .filter { !$0.isFinished }
        .map { $0.ioFinishTime }
        .min()!

        // cpu가 놀고 있었음 -> 시간 점프
        idleTime += (nextIOTime - currentTime)
        currentTime = nextIOTime
    }
}

for p in processes {
    currentTime = max(currentTime, p.ioFinishTime)
}


print(idleTime, currentTime)