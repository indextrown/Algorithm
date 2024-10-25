//
//  mymain.swift
//  Algorithm
//
//  Created by 김동현 on 8/14/24.
//

//        let a: [Int] = [1, 2, 3, 4, 5]
//        let n = 5
        

//        for i in 0..<n {
//            for j in i+1..<n {
//                for k in j+1..<n {
//                    print("\(a[i]) \(a[j]) \(a[k])")
//                }
//            }
//        }

import Foundation

@main
struct Main {
    static func main() {
        print(123)
        var numbers = [Int]()
        let n = 7
        var sum = 0
        
        for _ in 0..<9 {
            let inp = Int(readLine()!)!
            numbers.append(inp)
            sum += inp
        }
        
        var found = false
        
        for i in 0..<n {
            for j in i+1..<n {
                if sum - (numbers[i] + numbers[j]) == 100 {
                    for p in numbers {
                        if p != i && p != j{
                            print(p)
                        }
                    }
                    found = true
                    break
                }
            }
            if found {
                break
            }
        }
    }
}










