//
//  피보나치.swift
//  Algorithm
//
//  Created by 김동현 on 8/1/25.
//

import Foundation

func fibonacci(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    return fibonacci(n-1) + fibonacci(n-2)
}

func fibonacci2(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    var pp = 0
    var p = 1
    var result = 0
    
    for _ in 2...n {
        result = pp + p
        pp = p
        p = result
    }
    return result
}

@main
struct Main {
    static func main() {
        var start = CFAbsoluteTimeGetCurrent()
        var result = fibonacci(40)
        var duration = CFAbsoluteTimeGetCurrent() - start
        print("--- fibonacci(순환) ---")
        print("  - 결과: \(result)")
        print("  - 시간: \(String(format: "%.5f", duration))초")
        
        start = CFAbsoluteTimeGetCurrent()
        result = fibonacci2(40)
        duration = CFAbsoluteTimeGetCurrent() - start
        print("--- fibonacci(반복) ---")
        print("  - 결과: \(result)")
        print("  - 시간: \(String(format: "%.5f", duration))초")
        
        /*
         --- fibonacci(순환) ---
           - 결과: 102334155
           - 시간: 0.46330초
         --- fibonacci(반복) ---
           - 결과: 102334155
           - 시간: 0.00011초
         */
    }
}
