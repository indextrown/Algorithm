//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/29/24.
//

import Foundation

freopen("input.txt", "r", stdin)

let n = Int(readLine()!)!
var arr: [(String, Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let age = Int(input[0])!
    let name = String(input[1])
    
    arr.append((name, age))
}

arr.sort { $0.1 < $1.1 }
arr.forEach { print($0.1, $0.0) }




/*
 infos.forEach { print($0.age, $0.id )}
let n = Int(readLine()!)!
var myDict: [String:Int] = [:]

for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ")
    let num = Int(inputs[0])!
    let name = String(inputs[1])
    myDict[name] = num
}

for k in myDict.keys {
    print("\(k): \(myDict[k]!)")
}

let newDict = myDict.sorted { $0.value < $1.value }
    
for k in newDict {
    print(k)
}
*/
