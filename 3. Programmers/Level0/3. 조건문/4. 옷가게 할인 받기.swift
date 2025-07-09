//
//  4. 옷가게 할인 받기.swift
//  Algorithm
//
//  Created by 김동현 on 7/8/25.
//

import Foundation

func solution(_ price:Int) -> Int {
    
    let result: Double
    switch price {
    case 100_000..<300_000:
        result = Double(price) - (Double(price) * 0.05)
    case 300_000..<500_000:
        result = Double(price) - (Double(price) * 0.1)
    case 500_000...:
        result = Double(price) - (Double(price) * 0.2)
    default:
        result = Double(price)
    }
    
    return Int(result)
}

func solution2(_ price:Int) -> Int {
    
    let result: Double
    switch price {
    case 100_000..<300_000:
        result = Double(price) * 0.95
    case 300_000..<500_000:
        result = Double(price) * 0.9
    case 500_000...:
        result = Double(price) * 0.8
    default:
        result = Double(price)
    }
    
    return Int(result)
}
\func solution3(_ price:Int) -> Int {
    
    let discountRate: Int
    switch price {
    case 100_000..<300_000:
        discountRate = 95
    case 300_000..<500_000:
        discountRate = 90
    case 500_000...:
        discountRate = 80
    default:
        discountRate = 100
    }
    
    return price * discountRate / 100
}
