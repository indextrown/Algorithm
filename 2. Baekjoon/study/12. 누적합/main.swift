//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/25/25.
//
/*
 코딩테스트에서는 suffix sum은 잘 안나오고 prefix sum만 나온다
 
 N, M이 10만
 시간복잡도: 10만 * 10만 = 100억
 구간 쿼리 문제(합, 곱 연산) -> 여긴 구간 합 쿼리
 https://chanhhh.tistory.com/214
 
 psum[i] = 1번부터 i번까지의 합
 */

import Foundation
freopen("input.txt", "r", stdin)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])
var arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var psum = Array(repeating: 0, count: N + 1)

/**
 psum[i] = 1번부터 i번까지의 합
 psump[3] = arr[1] + arr[2] + arr[3]
 
 arr1, arr2, arr3, arr4
 
 arr1, arr2
 
 2 ~ 4
 
 psum[4] - psum[2-1]
 */
for i in 1...N {
    psum[i] = psum[i-1] + arr[i]
}

for _ in 0..<M {
    let q = readLine()!.split(separator: " ").map { Int($0)! }
    let i = q[0]
    let j = q[1]
    print(psum[j] - psum[i - 1])
}
