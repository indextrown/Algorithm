//
//  1. 배열 정렬하기.swift
//  Algorithm
//
//  Created by 김동현 on 11/27/24.
//

import Foundation

func solution(_ arr: [Int]) -> [Int] {
    return arr.sorted()
}

// 결과를 출력하는 함수
func printSolution(_ vec: [Int]) {
    print(vec.map { String($0) }.joined(separator: " "))
}

// 메인 함수
func main() {
    printSolution(solution([1, -5, 2, 4, 3])) 
    printSolution(solution([2, 1, 1, 3, 2, 5, 4]))
    printSolution(solution([6, 1, 7]))
}

//main()
