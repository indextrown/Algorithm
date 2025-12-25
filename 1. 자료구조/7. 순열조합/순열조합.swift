//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 9/13/25.
//

/*
 https://nasneyland.tistory.com/13
 https://devyul.tistory.com/129
 https://bibi6666667.tistory.com/430
 */
import Foundation
//
//// MARK: - 순열
//func permutations<T>(_ arr: [T], _ r: Int, _ picked: [T] = [], _ visited: inout [Bool]) {
//    if picked.count == r {
//        print(picked)
//        return
//    }
//    
//    for i in 0..<arr.count {
//        if visited[i] { continue }
//        visited[i] = true
//        permutations(arr, r, picked + [arr[i]], &visited)
//        visited[i] = false
//    }
//}
//
//// MARK: - 조합
//func combinations<T>(_ arr: [T], _ r: Int, _ index: Int = 0, _ picked: [T] = []) {
//    if picked.count == r {
//        print(picked)
//        return
//    }
//    if index >= arr.count { return }
//    
//    // 현재 원소를 포함하는 경우
//    combinations(arr, r, index + 1, picked + [arr[index]])
//    
//    // 현재 원소를 포함하지 않는 경우
//    combinations(arr, r, index + 1, picked)
//}
//
//// 실행 예시
//let arr = [1, 2, 3, 4]
//var visited = Array(repeating: false, count: arr.count)
//
//print("👉 순열 (2개 뽑기)")
//permutations(arr, 4, [], &visited)
//
//print("\n👉 조합 (2개 뽑기)")
//combinations(arr, 2)


// MARK: - 순열
func permutations<T>(_ arr: [T], _ r: Int) -> [[T]] {
    var result: [[T]] = []
    var visited = Array(repeating: false, count: arr.count)
    
    func backtrack(_ picked: [T]) {
        if picked.count == r {
            result.append(picked)
            return
        }
        
        for i in 0..<arr.count {
            if visited[i] { continue }
            visited[i] = true
            backtrack(picked + [arr[i]])
            visited[i] = false
        }
    }
    
    backtrack([])
    return result
}

// MARK: - 조합
func combinations<T>(_ arr: [T], _ r: Int) -> [[T]] {
    var result: [[T]] = []
    
    func backtrack(_ index: Int, _ picked: [T]) {
        if picked.count == r {
            result.append(picked)
            return
        }
        
        if index >= arr.count { return }
        backtrack(index + 1, picked + [arr[index]]) // 포함
        backtrack(index + 1, picked)                // 미포함
    }
    
    backtrack(0, [])
    return result
}

let arr = [1, 2, 3]

print("순열:", permutations(arr, 2))
print("조합:", combinations(arr, 2))
