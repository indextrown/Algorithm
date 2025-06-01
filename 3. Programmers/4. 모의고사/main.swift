//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/28/24.
//

import Foundation


func solution(_ answers: [Int]) -> [Int] {
    
    let firstPattern = [1, 2, 3, 4, 5]
    let secondPattern = [2, 1, 2, 3, 2, 4, 2, 5]
    let thirdParrern = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var scoreBox = Array(repeating: 0, count: 3)
    var answer: [Int] = []
    
    for i in 0..<answers.count {
        if answers[i] == firstPattern[i%firstPattern.count] { scoreBox[0] += 1 }
        if answers[i] == secondPattern[i%secondPattern.count] { scoreBox[1] += 1 }
        if answers[i] == thirdParrern[i%thirdParrern.count] { scoreBox[2] += 1 }
    }
    
    let maxScore: Int = scoreBox.max()!
    
    for i in 0..<3{
        if maxScore == scoreBox[i] {
            answer.append(i+1)
        }
    }
    return answer
}

func printSolution(_ vec: [Int]) {
    print(vec.map { String($0) }.joined(separator: " "))
}

func main() {
    printSolution(solution([1, 2, 3, 4, 5])) // 2 3 4 5 6 7
    printSolution(solution([1, 3, 2, 4, 2]))    // 2 5 7 9 12
}

main()







//import Foundation
//
//let firstPattern: [Int] = [1, 2, 3, 4, 5]
//let secondPattern: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
//let thirdPattern: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
//
//func solution(_ answers: [Int]) -> [Int] {
//    var answer: [Int] = []
//    var matchCnt: [Int] = Array(repeating: 0, count: 3) // 값, 배열크기
//    
//    for i in 0..<answers.count {
//        if answers[i] == firstPattern[i%firstPattern.count] {
//            matchCnt[0]+=1
//        }
//        if answers[i] == secondPattern[i%secondPattern.count] {
//            matchCnt[1]+=1
//        }
//        if answers[i] == thirdPattern[i%thirdPattern.count] {
//            matchCnt[2]+=1
//        }
//    }
//    
//    let maxScore: Int = matchCnt.max()!
//    
//    for i in 0..<3 {
//        if matchCnt[i] == maxScore {
//            answer.append(i+1)
//        }
//    }
//    return answer
//}
//
//func printSolution(_ vec: [Int]) {
//    print(vec.map { String($0) }.joined(separator: " "))
//}
//
//func main() {
//    printSolution(solution([1, 2, 3, 4, 5])) // 2 3 4 5 6 7
//    printSolution(solution([1, 3, 2, 4, 2]))    // 2 5 7 9 12
//}
//
//main()
