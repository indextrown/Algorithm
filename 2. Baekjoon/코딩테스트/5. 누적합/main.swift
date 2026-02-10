// import Foundation

// freopen("input.txt", "r", stdin)
// let input = readLine()!.split(separator: " ").map { Int($0)! }
// let (n, m) = (input[0], input[1])
// let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }


// for _ in 0..<m {
//     let range = readLine()!.split(separator: " ").map { Int($0)! }
//     let (a, b) = (range[0], range[1])
//     print(psum[b] - psum[a-1])
// }































// //
// //  main.swift
// //  Algorithm
// //
// //  Created by 김동현 on 2/2/26.
// //

// /*
//  1<=N<=100,000
//  1<=M<=100,000
//  1<=A<=B<=N
 
//  // 1 2 3 4 5 6 7 8
 
//  구간쿼리 키워드 : psum, 팬윅트리 생각나야함
//  */

// import Foundation

// freopen("input.txt", "r", stdin)
// let input = readLine()!.split(separator: " ").map { Int($0)! }
// let (n, m) = (input[0], input[1])
// let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }

// // 처음 접근 방법
// //for _ in 0..<m {
// //    let range = readLine()!.split(separator: " ").map { Int($0)! }
// //    let (a, b) = (range[0], range[1])
// //    var sum: Int = 0
// //    
// //    // 시간복잡도 최악: 10만 * 1만 = 100억...
// //    for i in a...b {
// //        sum += arr[i]
// //    }
// //    print(a, b, sum)
// //}




// 누적합 방법
// 1-based index 맞추기

import Foundation
freopen("input.txt", "r", stdin)
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var psum = Array(repeating: 0, count: n+1)

for i in 1...n {
    psum[i] = psum[i-1] + arr[i]
}

for _ in 0..<m {
    let range = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (range[0], range[1])
    print(psum[b] - psum[a-1])
}
