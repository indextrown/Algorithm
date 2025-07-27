//
//  2. 순서 바꾸기.swift
//  Algorithm
//
//  Created by 김동현 on 7/12/25.
//

import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [Int] {
    return Array(num_list[n...]) + Array(num_list[0...n-1])
}

func solution2(_ num_list:[Int], _ n:Int) -> [Int] {
     return Array(num_list.suffix(from: n)) + Array(num_list.prefix(n))
}

/*
@main
struct Main {
    static func main() {
        
        let arr = [1, 2, 3]
        if let test = arr[safe: 0] {
            print(test)
        }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
        // return indices ~= index ? self[index] : nil
    }
}
*/
