//
//  5. 각도기.swift
//  Algorithm
//
//  Created by 김동현 on 7/9/25.
//

import Foundation

/*
func solution(_ angle:Int) -> Int {
    let result: Int
    switch angle {
    case 1..<90:
        result = 1
    case 90:
        result = 2
    case 91..<180:
        result = 3
    case 180:
        result = 4
    default:
        result = 0
    }
    return result
}
*/

func solution(_ angle:Int) -> Int {
    let result: Int
    
    if angle > 0 && angle < 90 {
        result = 1
    } else if angle == 90 {
        result = 2
    } else if angle > 90 && angle < 180 {
        result = 3
    } else if angle == 180 {
        result = 4
    } else {
        result = 0
    }
    
    return result
}
