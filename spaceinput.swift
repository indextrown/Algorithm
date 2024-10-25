//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 9/18/24.
//

import Foundation

@main
struct Main {
    static func main() {
        let inputs = readLine()!.components(separatedBy: " ").map{Int($0)!}
        
        var sum: Int = 0
        
        for number in inputs {
            sum += number
        }
        
        print(sum)
    }
}
