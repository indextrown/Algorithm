//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/27/24.
//

import Foundation


func solution(_ numbers: [Int]) -> [Int] {

    // 배열 크기
    let cnt = numbers.count
    
    // 두 수의 합을 저장할 공간
    var set = Set<Int>()
    
    for i in 0..<cnt {
        for j in i+1..<cnt {
            set.insert(numbers[i] + numbers[j])
        }
    }
    return Array(set).sorted()
}

func printSolution(_ vec: [Int]) {
    print(vec.map { String($0) }.joined(separator: " "))
}

func main() {
    printSolution(solution([2, 1, 3, 4, 1])) // 2 3 4 5 6 7
    printSolution(solution([5, 0, 2, 7]))    // 2 5 7 9 12
}

main()


//func solution(_ numbers: [Int]) -> [Int] {
//    var set = Set<Int>()
//    for i in 0..<numbers.count {
//        for j in i+1..<numbers.count {
//            set.insert(numbers[i]+numbers[j])
//        }
//    }
//
//    return Array(set).sorted()
//}
//
//func printSolution(_ vec: [Int]) {
//    print(vec.map { String($0) }.joined(separator: " "))
//}
//
//func main() {
//    printSolution(solution([2, 1, 3, 4, 1])) // 2 3 4 5 6 7
//    printSolution(solution([5, 0, 2, 7]))    // 2 5 7 9 12
//}
//
////main()


