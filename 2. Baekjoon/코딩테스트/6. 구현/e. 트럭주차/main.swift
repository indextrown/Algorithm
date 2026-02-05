/*
[카운팅배열 유형]
시각은 이상 미만이다
시작시간, 끝난시간은 이상, 미만으로 하면 좋다
*/

import Foundation

freopen("input.txt", "r", stdin)

let input = readLine()!.split(separator: " ").map { Int($0)! }
var timeArr: [Int] = Array(repeating: 0, count: 101)

for _ in 0..<3 {
    let truck = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end) = (truck[0], truck[1])

    for i in start..<end {
        timeArr[i] += 1
    }
}

var sum: Int = 0
for cnt in timeArr {
    switch cnt {
        case 1: sum += input[0]
        case 2: sum += input[1] * 2
        case 3: sum += input[2] * 3
        default: break
    }
}

print(sum)