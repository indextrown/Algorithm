//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/6/24.
//
// https://www.acmicpc.net/problem/11866

import Foundation

freopen("input.txt", "r", stdin)

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, k) = (input[0], input[1])
//var person: [Int] = []

//for people in 1...n {
//    person.append(people)
//}

//var currentIdx = 0
//print("<", terminator: "")
//while !person.isEmpty {
//    currentIdx = (currentIdx + k - 1) % person.count
//    if person.count == 1 {
//        print(person[currentIdx], terminator: "")
//    } else {
//        print(person[currentIdx], terminator: ", ")
//    }
//    person.remove(at: currentIdx)
//}
//print(">")


let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
var person: [Int] = Array(1...n)
var results: [Int] = []

var currentIdx = 0
while !person.isEmpty {
    currentIdx = (currentIdx + k - 1) % person.count
    results.append(person.remove(at: currentIdx))
}

print("<\(results.map{String($0)}.joined(separator: ", "))>")













//var currentIdx = 0
//while !person.isEmpty {
//    currentIdx = (currentIdx + k - 1) % person.count
//    print(person[currentIdx%person.count])
//    person.remove(at: currentIdx%person.count)
//}


//
//var currentIdx = 2
//currentIdx = currentIdx%person.count
//person.remove(at: currentIdx)
//print(person, currentIdx)
//currentIdx += 2
//
//currentIdx = currentIdx%person.count
//person.remove(at: currentIdx)
//print(person, currentIdx)
//currentIdx += 2
//
//currentIdx = currentIdx%person.count
//person.remove(at: currentIdx)
//print(person, currentIdx)
//currentIdx += 2
//
//currentIdx = currentIdx%person.count
//person.remove(at: currentIdx)
//print(person, currentIdx)
//currentIdx += 2
//
//currentIdx = currentIdx%person.count
//person.remove(at: currentIdx)
//print(person, currentIdx)
//currentIdx += 2
//
//currentIdx = currentIdx%person.count
//person.remove(at: currentIdx)
//print(person, currentIdx)
//currentIdx += 2
//
//currentIdx = currentIdx%person.count
//person.remove(at: currentIdx)
//print(person, currentIdx)
//currentIdx += 2


// 1 2 3 4 5 6 7 시작
// 1 2 4 5 6 7   3 나가리
// 1 2 4 5 7     6 나가리
// 1 4 5 7       2 나가리
// 1 4 5         7 나가리
// 1 4           5 나가리
// 4             1 나가리
//               4 나가리

