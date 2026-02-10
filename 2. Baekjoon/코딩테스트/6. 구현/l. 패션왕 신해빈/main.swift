// 경우의수 = 곱하기

import Foundation
freopen("input.txt", "r", stdin)

let tcs = Int(readLine()!)!

for _ in 0..<tcs {
    
    // tc
    let n = Int(readLine()!)!
    var dic: [String: Int] = [:]
    for _ in 0..<n {
        let inp = readLine()!.split(separator: " ").map(String.init)
        let kind = inp[1]
        dic[kind, default: 0] += 1
    }
    
    let answer = dic.reduce(1) { $0 * ($1.value + 1) } - 1
    print(answer)

    // var result = 1
    // for value in dic.values {
    //     result *= (value + 1)
    // }
    // print(result - 1)
}

