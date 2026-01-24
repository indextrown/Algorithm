//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 1/18/26.
//

import Foundation

freopen("input.txt", "r", stdin)

//func combi<T>(_ targetArr: [T], _ targetNum: Int) -> [[T]] {
//    var result: [[T]] = []
//    
//    func dfs(_ index: Int, _ arr: [T]) {
//        if arr.count == targetNum {
//            result.append(arr)
//            return
//        }
//        
//        for i in index..<targetArr.count {
//            dfs(i+1, arr + [targetArr[i]])
//        }
//    }
//    dfs(0, [])
//    return result
//}
//
//var person: [Int] = []
//for _ in 0..<9 {
//    person.append(Int(readLine()!)!)
//}
//
//let combis = combi(person, 7)
//var result: [Int] = []
//
//for arr in combis {
//    if arr.reduce(0, +) == 100 {
//        result = arr.sorted()
//        break
//    }
//}
//
//result.forEach { print($0) }


//
//[1, 2, 3, 4, 5]
//12
//13
//14
//15
//23
//24
//25
//34
//35
//45

/*
var sum = 0
var person: [Int] = []

for _ in 0..<9 {
    let input = Int(readLine()!)!
    person.append(input)
    sum += input
}

for i in 0..<9 {
    for j in i+1..<9 {
        let pair = person[i] + person[j]
        
        if sum - pair == 100 {
            person[i] = 0
            person[j] = 0
        }
    }
}

for num in person.sorted() {
    if num != 0 {
        print(num)
    }
}

*/

var person: [Int] = []

func combination(_ arr: [Int],
                    _ r: Int,
                    _ start: Int,
                    _ selected: inout [Int]
) -> Bool {
    if selected.count == r {
        if selected.reduce(0, +) == 100 {
            selected.sorted().forEach { print($0) }
            return true
        }
        return false
    }
    
    for i in start..<arr.count {
        selected.append(arr[i])
        if combination(arr, r, i + 1, &selected) { return true }
        selected.removeLast()
    }
    return false
}

for _ in 0..<9 {
    let people = Int(readLine()!)!
    person.append(people)
}

var selected: [Int] = []
_ = combination(person, 7, 0, &selected)
