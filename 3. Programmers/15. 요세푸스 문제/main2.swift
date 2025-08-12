//
//  main2.swift
//  Algorithm
//
//  Created by 김동현 on 8/12/25.
//

import Foundation

@main
struct Main {
    static func main() {
        freopen("input.txt", "r", stdin)
        let input = readLine()!
        let parts = input.split(separator: " ")
        let (n, k) = (Int(parts[0])!, Int(parts[1])!)
        var circle: [Int] = Array(1...n)
        var idx = 0
        
        print("<", terminator: "")
        for count in stride(from: n, to: 0, by: -1) {
            idx = (idx + k - 1) % count
            print(circle.remove(at: idx), terminator: count == 1 ? "" : ", ")
        }
        print(">")
        
    }
}

/*
@main
struct Main {
    static func main() {
        freopen("input.txt", "r", stdin)
        
        let input = readLine()!
        let parts = input.split(separator: " ")
        let (n, k) = (Int(parts[0])!, Int(parts[1])!)
        var circle: [Int] = Array(1...n)
        var removed: [Int] = []
        
        var index = 0
        while !circle.isEmpty {
            index = (index + k - 1) % circle.count
            removed.append(circle.remove(at: index))
        }
        
        let output = "<" + removed.map { String($0) }.joined(separator: ", ") + ">"
        print(output)
        
    }
}
*/


