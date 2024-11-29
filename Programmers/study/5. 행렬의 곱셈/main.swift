//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/28/24.
//

// 조건: 행과 열의 길이는 2이상 100이하
//      행렬 arr1, arr2원소는 -10 이상 20 이하인 자연수

// https://school.programmers.co.kr/learn/courses/30/lessons/12949
// https://portrait-of-youngblood.tistory.com/6

import Foundation

func solution(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
    let rows: Int = arr1.count
    let cols: Int = arr2[0].count
    var answer = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    
    // MARK: - arr1의 각 행과 arr2의 각 열에 대한 반복문 수행
    for i in 0..<rows {                 // 행 길이(세로) arr1의 행 반복
        for j in 0..<cols {             // 열 길이(가로) arr2의 열 반복
            for k in 0..<arr2.count {   // 공통 차원
                answer[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }
    return answer
}

func print2D(_ vec: [[Int]]) {
    for row in vec {
        print(row.map { String($0) }.joined(separator: " "))
    }
    print()
}

func main() {
    print2D(solution(
        [
            [1, 4],
            [2, 3],
            [4, 1]
        ],
        [
            [3, 3],
            [3, 3]
        ]))
    
    print2D(solution(
        [
           [2, 3, 2],
           [4 ,2, 4],
           [3, 1, 4]
        ],
        [
            [5, 4, 3],
            [2, 4, 1],
            [3, 1, 1]
        ]))
}

main()

