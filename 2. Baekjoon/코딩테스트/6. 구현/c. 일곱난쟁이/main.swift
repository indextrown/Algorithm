//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 2/3/26.
//

import Foundation

freopen("input.txt", "r", stdin)

@discardableResult
func combi<T>(_ arr: [T], _ r: Int, _ start: Int, _ selected: inout [T], _ visit: ([T]) -> Bool) -> Bool {
    // r개 다 뽑았으면
    if selected.count == r {
        return visit(selected)
    }
    
    // 뒤에서 r개 못 채우면 중단
    for i in start..<arr.count {
        selected.append(arr[i])
        if combi(arr, r, i+1, &selected, visit) { return true }
        selected.removeLast()
    }
    
    return false
}

var person: [Int] = []
for _ in 0..<9 {
    person.append(Int(readLine()!)!)
}

var selected: [Int] = []
combi(person, 7, 0, &selected) { selected in

    if selected.reduce(0, +) == 100 {
        selected.sorted().forEach { print($0) }
        return true
    }
    
    return false
}
