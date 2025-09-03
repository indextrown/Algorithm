//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/21/25.
//


import Foundation
freopen("input.txt", "r", stdin)

var arr: [Int] = []
var sum: Int = 0
var found: Bool = false

for _ in 0..<9 {
    let num = Int(readLine()!)!
    arr.append(num)
    sum += num
}

for i in 0..<9 where found == false {
    for j in i+1..<9 {
        let pair = arr[i] + arr[j]
        if sum - pair == 100 {
            arr[i] = 0
            arr[j] = 0
            found = true
            break
        }
    }
}

for num in arr.sorted() {
    if num != 0 {
        print(num)
    }
}


/*
import Foundation
freopen("input.txt", "r", stdin)

var arr: [Int] = []
var sum: Int = 0

for _ in 0..<9 {
    let num = Int(readLine()!)!
    arr.append(num)
    sum += num
}

func solve() {
    for i in 0..<9 {
        for j in i+1..<9 {
            let pair = arr[i] + arr[j]
            if sum - pair == 100 {
                let result = arr.enumerated()
                    .filter { $0.offset != i && $0.offset != j } // O(n)
                    .map { $0.element }                          // O(n)
                    .sorted()                                    // O(nlogn)
                
                for num in result {
                    print(num)
                }
                return
            }
        }
    }
}
solve()
*/




/*
 import Foundation
 freopen("input.txt", "r", stdin)
 
 var arr: [Int] = []
 var sum: Int = 0
 
 for _ in 0..<9 {
 let num = Int(readLine()!)!
 arr.append(num)
 sum += num
 }
 
 outerLoop: for i in 0..<9 {
 for j in i+1..<9 {
 let pair = arr[i] + arr[j]
 if sum - pair == 100 {
 arr[i] = 0
 arr[j] = 0
 break outerLoop
 }
 }
 }
 
 for num in arr.sorted() {
 if num != 0 {
 print(num)
 }
 }
 */
