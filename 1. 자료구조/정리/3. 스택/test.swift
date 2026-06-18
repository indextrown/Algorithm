//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 8/25/25.
//

import Foundation

func play() {
    freopen("input.txt", "r", stdin)
    let input = readLine()!.split(separator: " ")
    let (n, k) = (Int(input[0])!, Int(input[1])!)
    
    var person = Array(1...n)
    var result: [Int] = []
    var index = 0
    
    while !person.isEmpty {
        index = (index + k - 1) % person.count
        let pop = person.remove(at: index)
        result.append(pop)
    }
    
    print("<\(result.map { String($0) }.joined(separator: ", "))>")
}

@main
struct Main {
    static func main() {
        play()
    }
}
