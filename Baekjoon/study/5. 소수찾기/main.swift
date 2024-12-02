//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/3/24.
//
// https://www.acmicpc.net/problem/1978

import Foundation

freopen("input.txt", "r", stdin)
let _: Int = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var cnt: Int = 0

for num in arr {
    var isDivisible = false
    
    // 숫자가 1이 아니면서 1과 자기자신을 제외한 다른 숫자가 존재하면 해당 숫자는 무시
    if num != 1 {
        for i in 2..<num {
            if num % i == 0 {
                isDivisible = true
            }
        }
        if !isDivisible {
            cnt = cnt + 1
        }
    }
}
print(cnt)


//var n = Int(readLine()!)!
//var input = readLine()!.split(separator: " ").map {Int($0)!}
//var count = 0
//
//for i in input {
//    let arr = (1..<i).filter { i%$0 == 0 }
//    
//    if arr.count == 1 {
//        count = count + 1
//    }
//}
//
//print(count)
