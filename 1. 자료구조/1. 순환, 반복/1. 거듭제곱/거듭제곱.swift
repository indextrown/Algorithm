//
//  거듭제곱.swift
//  Algorithm
//
//  Created by 김동현 on 7/29/25.
//

import Foundation

func power(x: Int, n: Int) -> Int {
    return Array(repeating: x, count: n).reduce(1, *)
}

// 순환 호출을 할 때마다 문제의 크기는 약 절반으로 줄어든다 2^k -> 2^(k-1) -> 2^(k-2) ... -> 2^0
func powerRec(x: Int, n: Int) -> Int {
    
    if n == 0 { return 1 }
    
    else if n % 2 == 0 {
        // 짝수라면
        return powerRec(x: x*x, n: n/2)
    } else {
        // 홀수라면
        return x * powerRec(x: x*x, n: (n-1)/2)
    }
}

func powerRec2(x: Int, n: Int) -> Int {
    
    if n == 0 { return 1 }
    
    let half = powerRec2(x: x, n: n/2)
    if n % 2 == 0 {
        // 짝수라면
        return half * half
    } else {
        // 홀수라면
        return x * half * half
    }
}

@main
struct Main {
    static func main() {
        
        let start1 = CFAbsoluteTimeGetCurrent()
        let result1 = power(x: 2, n: 30)
        let end1 = CFAbsoluteTimeGetCurrent()
        let duration1 = end1 - start1
        print("--- Power(반복문) ---")
        print("  - 결과: \(result1)")
        print("  - 시간: \(String(format: "%.5f", duration1))초")
        
        
        let start2 = CFAbsoluteTimeGetCurrent()
        let result2 = powerRec(x: 2, n: 30)
        let end2 = CFAbsoluteTimeGetCurrent()
        let duration2 = end2 - start2
        print("--- Power(순환1) ---")
        print("  - 결과: \(result2)")
        print("  - 시간: \(String(format: "%.5f", duration2))초")
        
        let start3 = CFAbsoluteTimeGetCurrent()
        let result3 = powerRec2(x: 2, n: 30)
        let end3 = CFAbsoluteTimeGetCurrent()
        let duration3 = end3 - start3
        print("--- Power(순환2) ---")
        print("  - 결과: \(result3)")
        print("  - 시간: \(String(format: "%.5f", duration3))초")
    }
}



//print("--- Swift Array (as Stack) ---")
//var arrayStack: [Int] = []
//start = CFAbsoluteTimeGetCurrent()
//for i in 0..<testCount {
//    arrayStack.append(i)
//}
//duration = CFAbsoluteTimeGetCurrent() - start
//print("  - Append: \(String(format: "%.4f", duration))초")
