//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 2/2/26.
//

import Foundation

func permutation<T>(_ arr: inout [T], _ r: Int, _ depth: Int, _ visit: (([T]) -> Void)) {
    
    if depth == r {
        return visit(Array(arr[0..<r]))
    }
    
    for i in depth..<arr.count {
        arr.swapAt(i , depth)
        permutation(&arr, r, depth + 1, visit)
        arr.swapAt(i, depth)
    }
}

@discardableResult
func permutation<T>(_ arr: inout [T], _ r: Int, _ depth: Int, _ visit: (([T]) -> Bool)) -> Bool {

    if depth == r {
        return visit(Array(arr[0..<r]))
    }
    
    for i in depth..<arr.count {
        arr.swapAt(i, depth)
        if permutation(&arr, r, depth + 1, visit) { return true }
        arr.swapAt(i, depth)
    }
    
    return false
}



/// 조합
/// - Parameters:
///   - arr: 조합을 만들 원본 배열 (순서는 유지되며, 조합에서는 순서가 의미 없음)
///   - r: 선택할 원소의 개수
///   - start: 다음에 선택할 수 있는 시작 인덱스
///   - selected: 현재까지 선택된 원소들을 담는 배열(DFS 과정에서 append / removeLast로 관리됨)
///   - visit: r개의 원소가 모두 선택되었을 때 호출되는 클로저
func combi<T>(_ arr: [T], _ r: Int, _ start: Int, _ selected: inout [T],_ visit: ([T]) -> Void) {
    
    // r개 다 뽑았으면
    if selected.count == r {
        visit(selected)
        return
    }
    
    // 뒤에서 r개 못 채우면 중단(가지치기)
    for i in start..<arr.count {
        selected.append(arr[i])
        combi(arr, r, i+1, &selected, visit)
        selected.removeLast()
    }
}

var arr = [1, 2, 3]
permutation(&arr, 3 , 0) { perm in
    print(perm)
    return false
}

var selected: [Int] = []
combi(arr, 3, 0, &selected) { comb in
    print(comb)
}

// 조합 반복문 방식
for i in 0..<arr.count {
    for j in 0..<i {
        for k in 0..<j {
            print("\(arr[i]) \(arr[j]) \(arr[k])")
        }
    }
}



