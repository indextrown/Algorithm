//
//  순열조합템플릿.swift
//  Algorithm
//
//  Created by 김동현 on 1/24/26.
//

import Foundation

// 순열
func permutationIndex(_ n: Int,
                      _ r: Int,
                      _ depth: Int,
                      _ arr: inout [Int]
) {
    if depth == r {
        print(Array(arr[0..<r]))
        return
    }
    
    for i in depth..<n {
        arr.swapAt(i, depth)
        permutationIndex(n, r, depth + 1, &arr)
        arr.swapAt(i, depth) // 백트래킹
    }
}

// 순열 + 실제 배열
func permutation<T>(_ arr: inout [T],
                    _ r: Int,
                    _ depth: Int
) {
    if depth == r {
        print(Array(arr[0..<r]))
        return
    }
    
    for i in depth..<arr.count {
        arr.swapAt(i, depth)
        permutation(&arr, r, depth + 1)
        arr.swapAt(i, depth) // 백트래킹
    }
}

// 조합
func combinationIndex(_ n: Int,
                      _ r: Int,
                      _ start: Int,
                      _ selected: inout [Int]
) {
    if selected.count == r {
        print(selected)
        return
    }
    
    for i in start..<n {
        selected.append(i)
        combinationIndex(n, r, i + 1, &selected)
        selected.removeLast()
    }
}

// 조합 + 실제배열
func combination<T>(_ arr: [T],
                    _ r: Int,
                    _ start: Int,
                    _ selected: inout [T]
) {
    if selected.count == r {
        print(selected)
        return
    }
    
    for i in start..<arr.count {
        selected.append(arr[i])
        combination(arr, r, i + 1, &selected)
        selected.removeLast()
    }
}

@main
struct Main {
    static func main() {
        var arr = Array(0..<4)   // [0, 1, 2, 3]
        permutationIndex(4, 2, 0, &arr)
        
        var fruits = ["🍎", "🍌", "🍇", "🍓"]
        permutation(&fruits, 2, 0)

        var selected: [Int] = []
        combinationIndex(4, 2, 0, &selected)

        var picked: [String] = []
        combination(fruits, 2, 0, &picked)
    }
}
