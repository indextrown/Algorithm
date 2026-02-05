/*
[카운팅배열 유형]
https://www.acmicpc.net/problem/1159

- Counting Star는 Map 또는 배열
- cnt[a - 97]
*/

import Foundation

freopen("input.txt", "r", stdin)

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: 26)
var result = ""

for _ in 0..<n {
    let cmd = readLine()!
    let firstChar = cmd.first!
    let idx = Int(firstChar.asciiValue!)
    arr[idx - 97] += 1
}

for i in 0..<26 {
    if arr[i] >= 5 {
        result.append(Character(UnicodeScalar(i+97)!))
    }
}

print(result.isEmpty ? "PREDAJA" : result)