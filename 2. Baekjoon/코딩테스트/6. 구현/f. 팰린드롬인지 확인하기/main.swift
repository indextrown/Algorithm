/*
[회문]
거꾸로 읽어도 똑바로 읽어도 똑같은 언어

[배운점]
index(chars.startIndex, offsetBy: i)
*/

import Foundation

freopen("input.txt", "r", stdin)

// let chars = readLine()!
// var result: Bool = true

// for i in 0..<chars.count/2 {

//     let left = chars.index(chars.startIndex, offsetBy: i)
//     let right = chars.index(chars.startIndex, offsetBy: chars.count - i - 1)

//     if chars[left] != chars[right] { result = false }
// }

// print(result ? 1 : 0)


let chars = readLine()!
if chars == String(chars.reversed()) {
    print(1)
} else {
    print(0)
}