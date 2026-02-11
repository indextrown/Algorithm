/*
갑옷 = 고유한 두 재료 번호 합쳐서 M이 되면 갑옷이 만들어진다
재료로 몇개의 값옷을 만들 수 있는가?
N: 재료
M: 갑옷 조건
*/

// import Foundation
// freopen("input.txt", "r", stdin)
// let n = Int(readLine()!)!
// let m = Int(readLine()!)!
// let numbers = readLine()!.split(separator: " ").map { Int($0)! }

// var count = 0
// for i in 0..<numbers.count {
//     for j in i+1..<numbers.count {
//         if numbers[i] + numbers[j] == m { count += 1 }
//     }
// }
// print(count)

import Foundation
freopen("input.txt", "r", stdin)
let n = Int(readLine()!)!
let m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var visited = Set<Int>()

var count = 0
for num in numbers {
    if visited.contains(m - num) {
        count += 1
    }
    visited.insert(num)
};print(count)