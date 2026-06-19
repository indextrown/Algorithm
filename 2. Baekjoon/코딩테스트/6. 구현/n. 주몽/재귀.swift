/*
갑옷 = 고유한 두 재료 번호 합쳐서 M이 되면 갑옷이 만들어진다
재료로 몇개의 값옷을 만들 수 있는가?
N: 재료
M: 갑옷 조건
*/

import Foundation

freopen("input.txt", "r", stdin)

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var count = 0

func combi(_ idx: Int, _ selected: inout [Int]) {
    if selected.count == 2 {
        if numbers[selected[0]] + numbers[selected[1]] == m {
            count += 1
        }
        return
    }

    for i in idx + 1..<n {
        selected.append(i)
        combi(i, &selected)
        selected.removeLast()
    }
}

var selected: [Int] = []
combi(-1, &selected)
print(count)






// import Foundation

// freopen("input.txt", "r", stdin)

// let n = Int(readLine()!)!
// let m = Int(readLine()!)!
// let numbers = readLine()!.split(separator: " ").map { Int($0)! }
// var count = 0

// func combi(_ idx: Int, _ selected: inout [Int]) {
//     if selected.count == 2 {
//         if selected[0] + selected[1] == m {
//             count += 1
//         }
//         return
//     }

//     for i in idx + 1..<n {
//         selected.append(numbers[i])
//         combi(i, &selected)
//         selected.removeLast()
//     }
// }

// var selected: [Int] = []
// combi(-1, &selected)
// print(count)


