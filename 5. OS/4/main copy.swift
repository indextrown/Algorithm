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

// import Foundation

// freopen("input.txt", "r", stdin)

// let n = Int(readLine()!)!
// var arr: [[Int]] = []

// for _ in 0..<n {
//     let input = readLine()!.split(separator: " ").map { Int($0)! }
//     arr.append(input)
// }

// print(arr)


import Foundation
freopen("input.txt", "r", stdin)

// 입력
let n = Int(readLine()!)!

class Process {
    var queue: [Int] = [] // cpu , io 작업 번갈아 들어 있음
    var ioFinAt: Int = 0  // io가 끝나는 시각(0이면 아직 io아닌 상태)
}

var processes: [Process] = (0..<n).map { _ in Process() }

// 각 프로세스 입력
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for value in input {
        if value == -1 { break }
        processes[i].queue.append(value)
    }
}

var curTime = 0   // 현재 시간
var idleTime = 0  // cpu가 놀고 있었던 시간

while true {
    // 모든 프로세스 종료 확인
    var allFinished = true
    
    for p in processes {
        if !p.queue.isEmpty {
            allFinished = false
            break
        }
    }
    if allFinished { break }

    var cpuWorked = false

    // 번호 작은 프로세스부터 확인
    for p in processes {
        if !p.queue.isEmpty && p.ioFinAt <= curTime {

            cpuWorked = true

            // CPU burst 실행
            let cpuTime = p.queue.removeFirst()
            curTime += cpuTime

            // 다음이 I/O면 처리
            if !p.queue.isEmpty {
                let ioTime = p.queue.removeFirst()
                p.ioFinAt = curTime + ioTime
            }

            break
        }
    }

    // CPU가 놀았으면
    if !cpuWorked {
        var moveTo = Int.max

        for p in processes {
            if !p.queue.isEmpty {
                moveTo = min(moveTo, p.ioFinAt)
            }
        }

        idleTime += moveTo - curTime
        curTime = moveTo
    }
}

// 마지막 남은 I/O 완료 시간 반영
for p in processes {
    curTime = max(curTime, p.ioFinAt)
}

print(idleTime, curTime)
