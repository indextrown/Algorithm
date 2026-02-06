/*
n: 포켓몬 개수(1<=n<=100,000)
m: 문제 개수(1<=m<=100,000)

포켓몬 번호가 1인것붜 하나씩 들어옴
- 첫 글자만 대문자 + 나머지 소문자
- 트릭: 일부는 마지막 문자만 대문자

[풀이]
- strToInt는 Dictionary
- intToStrs는 Array, Dictionary 둘다 된다

*/

import Foundation

freopen("input.txt", "r", stdin)
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var strDic: [String: Int] = [:]
var intToStrArr: [String] = Array(repeating: "", count: n+1)
var output = ""

for i in 1..<n+1 {
    let inp = readLine()!
    strDic[inp] = i
    intToStrArr[i] = inp 
}

for _ in 0..<m {
    let inp = readLine()!
    
    // 정수로 변환된다면
    if let int = Int(inp) {
        output+=intToStrArr[int] + "\n"
    } 
    // 정수로 변환안된다면
    else {
        output+=String(strDic[inp]!) + "\n"
    }
}
print(output)




// import Foundation

// freopen("input.txt", "r", stdin)
// let input = readLine()!.split(separator: " ").map { Int($0)! }
// let (n, m) = (input[0], input[1])
// var strDic: [String: Int] = [:]
// var intDic: [Int: String] = [:]
// var output = ""

// for i in 1..<n+1 {
//     let inp = readLine()!
//     strDic[inp] = i
//     intDic[i] = inp 
// }

// for _ in 0..<m {
//     let inp = readLine()!
    
//     // 정수로 변환된다면
//     if let int = Int(inp) {
//         output+=intDic[int]! + "\n"
//     } 
//     // 정수로 변환안된다면
//     else {
//         output+=String(strDic[inp]!) + "\n"
//     }
// }
// print(output)







// import Foundation

// // FileIO
// final class FileIO {
//     private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0]
//     private var index: Int = 0
    
//     @inline(__always) private func read() -> UInt8 {
//         defer { index += 1 }
//         return buffer[index]
//     }
    
//     @inline(__always) func readInt() -> Int {
//         var sum = 0
//         var now = read()
//         var isPositive = true
        
//         while now == 10 || now == 32 { now = read() } // 공백, 개행 skip
//         if now == 45 { isPositive.toggle(); now = read() } // '-'
        
//         while now >= 48 {
//             sum = sum * 10 + Int(now - 48)
//             now = read()
//         }
//         return sum * (isPositive ? 1 : -1)
//     }
    
//     @inline(__always) func readString() -> String {
//         var bytes: [UInt8] = []
//         var now = read()
        
//         while now == 10 || now == 32 { now = read() } // 공백, 개행 skip
        
//         while now != 10 && now != 32 && now != 0 {
//             bytes.append(now)
//             now = read()
//         }
//         return String(bytes: bytes, encoding: .ascii)!
//     }
// }

// // ==========================
// // 문제 풀이 시작
// // ==========================

// let file = FileIO()

// let n = file.readInt()
// let m = file.readInt()

// var nameToIndex: [String: Int] = [:]
// var indexToName = Array(repeating: "", count: n + 1)

// for i in 1...n {
//     let name = file.readString()
//     nameToIndex[name] = i
//     indexToName[i] = name
// }

// var output = ""
// output.reserveCapacity(m * 8) // 출력 최적화 (선택)

// for _ in 0..<m {
//     let query = file.readString()
    
//     // 첫 글자가 숫자면 번호
//     if let first = query.first, first.isNumber {
//         let idx = Int(query)!      // 여기서는 실패 안 함
//         output += indexToName[idx]
//     } else {
//         output += String(nameToIndex[query]!)
//     }
//     output += "\n"
// }

// print(output)
