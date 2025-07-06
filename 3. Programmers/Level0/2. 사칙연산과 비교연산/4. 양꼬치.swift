//
//  4. 양꼬치.swift
//  Algorithm
//
//  Created by 김동현 on 7/6/25.
//

import Foundation

/*
func solution(_ n:Int, _ k:Int) -> Int {
    let result = (12000 * n + 2000 * k) - (n / 10 * 2000)
    return result
}
*/

func solution(_ n:Int, _ k:Int) -> Int {
    let result = 12000 * n + 2000 * (k - (n/10))
    return result
}
