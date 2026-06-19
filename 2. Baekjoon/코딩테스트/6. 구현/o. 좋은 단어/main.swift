/*
[분석]
- 같은 글자끼리 쌍을 짓는다
- 선끼리 교차하지 않으면서 같은 글자와 짝지을 수 있어야 한다

ABAB X
AABB O
ABBA O

AAA X
AA O
AB X

[풀이]
*/

import Foundation

freopen("input.txt", "r", stdin)

let n = Int(readLine()!)!
var count = 0
for _ in 0..<n {

    var stack: [Character] = []
    let str = readLine()!
    for ch in str {
        // top이 존재하면서 top과 ch가 일치한다면 
        if let top = stack.last, top == ch {
            stack.removeLast()
        } else {
            stack.append(ch)
        }
    }
    if stack.isEmpty {
        count += 1
    }
}
print(count)