//
//  1. sort()함수 사용하지 않고 O(N^2) 정렬 알고리즘.swift
//  Algorithm
//
//  Created by 김동현 on 5/26/25.
//

/*
 버블 정렬 시간 122.9066초
 기본 정렬 시간: 0.0449초
 */
import Foundation

func bubbleSortgo(arr: inout [Int]) {
    let n = arr.count
    for i in 0..<n-1 {
        for j in 0..<n-1-i {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
}

func start() {
    let size = 30000
    let originalArray = Array(1...size).shuffled()

    // 버블 정렬 테스트
    var bubbleArray = originalArray
    let startBubble = Date().timeIntervalSince1970
    bubbleSortgo(arr: &bubbleArray)
    let endBubble = Date().timeIntervalSince1970
    let timeBubble = endBubble - startBubble
    
    // Swift 기본 정렬 테스트
    var swiftSortArray = originalArray
    let startSwiftSort = Date().timeIntervalSince1970
    swiftSortArray.sort()
    let endSwiftSort = Date().timeIntervalSince1970
    let timeSwift = endSwiftSort - startSwiftSort
    
    // 결과
    print("버블 정렬 시간 \(String(format: "%.4f", timeBubble))초")
    print("기본 정렬 시간: \(String(format: "%.4f", timeSwift))초")
}

@main
struct Main {
    static func main() {
        start()
    }
}


