//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/28/24.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12949
import Foundation

func solution(_ answers: [Int]) -> [Int] {
    let pattern = (
        firstPattern: [1, 2, 3, 4 ,5],
        secondPattern: [2, 1, 2, 3, 2, 4, 2, 5],
        thirdPattern: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    )
    
    var point = [1:0, 2:0, 3:0]
    
    for (i, v) in answers.enumerated() {
        if v == pattern.firstPattern[i%5] { point[1] = point[1]! + 1 }
        if v == pattern.secondPattern[i%8] { point[2] = point[2]! + 1 }
        if v == pattern.thirdPattern[i%10] { point[3] = point[3]! + 1 }
    }
    
    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}

func printSolution(_ vec: [Int]) {
    print(vec.map { String($0) }.joined(separator: " "))
}

func main() {
    printSolution(solution([1, 2, 3, 4, 5])) // 2 3 4 5 6 7
    printSolution(solution([1, 3, 2, 4, 2]))    // 2 5 7 9 12
}

//main()

