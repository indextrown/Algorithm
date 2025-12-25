//
//  set.swift
//  Algorithm
//
//  Created by 김동현 on 8/1/25.
//
/*
 https://babbab2.tistory.com/114
 */

import Foundation

@main
struct Main {
    static func main() {
        
        var set: Set<Int> = [1, 2, 3, 4, 5]
        
        print(set.count)
        print(set.isEmpty)
        print(set.contains(3))
        
        // MARK: - Insert
        // 값을 추가하고 추가된 결과를 튜플로 리턴(중복이면 false, 추가된 값)
        let _ = set.insert(1) // (false, 1)
        let _ = set.insert(6) // (true, 6)
        
        // MARK: - Update
        // 값이 존재하지 않으면 추가 후 nil 리턴, 존재할 경우 덮어쓰기 후 덮어쓰기 전 값
        let _ = set.update(with: 1)   // Optional(1)
        let _ = set.update(with: 120) // nil
        
        // MARK: - Delete
        // 한 가지 요소 삭제할 때 사용, 삭제 후 삭제한 값 리턴
        let _ = set.remove(1)    // Optional(1)
        let _ = set.remove(100)  // nil
        
        // 전체 요소 삭제
        set.removeAll()

    }
}
