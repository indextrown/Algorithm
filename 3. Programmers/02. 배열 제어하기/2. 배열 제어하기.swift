//
//  2. 배열 제어하기.swift
//  Algorithm
//
//  Created by 김동현 on 11/27/24.
//

import Foundation

func compare(_ a: Int, _ b: Int) -> Bool {
    return a > b
}

func solution(_ lst: [Int]) -> [Int] {
    let setList = Array(Set(lst))
    let sortedList = setList.sorted(by: compare)
    return sortedList
}

// 결과를 출력하는 함수
func printSolution(_ vec: [Int]) {
    print(vec.map { String($0) }.joined(separator: " "))
}

// 메인 함수
func main() {
    printSolution(solution([4, 2, 2, 1, 1, 3, 4])) // 4 3 2 1
    printSolution(solution([2, 1, 1, 3, 2, 5, 4])) // 5 4 3 2 1
}

//main()
