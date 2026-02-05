/*
[구간합=PrefixSum]
- psum[i] = psum[i-1] + a[i]
- 최대값 구하라 = 최소값부토 최대값을 구하는 것이다
- 슬라이딩윈도우 또는 누적합으로 풀 수 있다

[문제]
N: 온도 측정한 날짜 수
K:(1~N사이 정수) 합을 구하기 위한 연속적인 날짜 수
순회 횟수: 전체 - 합칠개수 + 1
*/

/*
[첫시도]
- 시간초과

import Foundation

freopen("input.txt", "r", stdin)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
let temperature: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var top = Int.min

for i in 0..<n-k+1 {
    let sum = Array(temperature[i..<i+k]).reduce(0, +)

    if sum > top {
        top = sum
    }
}
print(top)
*/



// [슬라이딩 윈도우]
// import Foundation

// freopen("input.txt", "r", stdin)

// let input = readLine()!.split(separator: " ").map { Int($0)! }
// let (n, k) = (input[0], input[1])
// let temperature: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

// var currentSum = 0
// for i in 0..<k {
//     currentSum += temperature[i]
// }

// var maxSum = currentSum
// for i in k..<n {
//     currentSum += temperature[i]
//     currentSum -= temperature[i-k]
//     maxSum = max(maxSum, currentSum)
// }

// print(maxSum)




// [PrefixSum]
import Foundation

freopen("input.txt", "r", stdin)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
let temperature: [Int] = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var psum = Array(repeating: 0, count: n+1)
var maxValue = Int.min

for i in 1...n {
    psum[i] = psum[i-1] + temperature[i]
}

for i in k...n {
    maxValue = max(maxValue, psum[i] - psum[i-k])
}
print(maxValue)




