//
//  6. 점의 위치 구하기.swift
//  Algorithm
//
//  Created by 김동현 on 7/9/25.
//

import Foundation

/*
func solution(_ dot:[Int]) -> Int {
    
    if dot[0] > 0 && dot[1] > 0 {
        return 1
    } else if dot[0] < 0 && dot[1] > 0 {
        return 2
    } else if dot[0] < 0 && dot[1] < 0 {
        return 3
    } else {
        return 4
    }
}
*/

/*
func solution(_ dot:[Int]) -> Int {
    
    let x = dot[0], y = dot[1]
    
    switch (x, y) {
    case (1..., 1...): return 1
    case (...0, 0...): return 2
    case (...0, ...0): return 3
    case (0..., ...0): return 4
    default: return 0
    }
}
*/

func solution(_ dot:[Int]) -> Int {
    
    let x = dot[0], y = dot[1]
    
    switch (x, y) {
    case (let x, let y) where x > 0 && y > 0: return 1
    case (let x, let y) where x < 0 && y > 0: return 2
    case (let x, let y) where x < 0 && y < 0: return 3
    case (let x, let y) where x > 0 && y < 0: return 4
    default: return 0
    }
}
