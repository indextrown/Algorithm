/*
[접두사, 접미사 비교 문제]
- 한글자만 들어온다고 생각하고 로직을 구현하면 X
- 예시에서 한글자라도 조건에서 한글자만 들어온다는 말이 없는걸 반드시 확인해야 한다


*/

import Foundation

freopen("input.txt", "r", stdin)

let n = Int(readLine()!)!
let format = readLine()!.split(separator: "*").map { String($0) }
let (prefix, suffix) = (format[0], format[1])
var result = ""

for _ in 0..<n {
    let str = readLine()!
    
    // 반례: format의 prefix + suffix길이보다 문자열이 작으면 위반
    if (prefix.count + suffix.count) > str.count { 
        result += "NE\n" 
        continue
    }

    if str.hasPrefix(prefix) && str.hasSuffix(suffix) {
        result += "DA\n"
    } else {
        result += "NE\n"
    }
}
print(result)