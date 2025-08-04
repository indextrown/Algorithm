//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 7/9/25.
//

import Foundation

/*
 1 <= price <= 10,000
 2 <= price길이 <= 100,000 => 시간복잡도가 O(N)으로 접근해야 한다, 알고리즘이 떠오르지 않으면 O(n^2)으로 정확성 테스트 정보 확보하자
 */

func solution1(_ prices:[Int]) -> [Int] {
    var answer: [Int] = []
    
    for i in 0..<prices.count {
        var seconds: Int = 0
        
        for j in i+1..<prices.count {
            // 기존 접근: 가격이 떨어지면 바로 건너뜀, 떨어진 시점은 포함해야함
            /*
            if prices[i] <= prices[j] {
                seconds += 1
            }
            */
            
            // 해결: 가격이 떨어져도 그 순간은 포함해야 하므로 1더해주고 종료
            seconds += 1
            if prices[i] > prices[j] {
                break
            }
            
        }
        answer.append(seconds)
    }
    return answer
}

// MARK: - O(n^2)
func solution2(_ prices:[Int]) -> [Int] {
    
    /*
     가격이 떨어지지 않은 시간을 구하는 문제인데
     가격이 떨어지지 않은 횟수만 세고 떨어지는 시점에는 반복을 종료하지 않았다..
     
     var result: [Int] = []
     for i in 0..<prices.count {
         var count = 0
         for j in i+1..<prices.count {
             if prices[i] <= prices[j] {
                 count += 1
             }
         }
         result.append(count)
     }
     return result
     */
    
    var result: [Int] = []
    for i in 0..<prices.count {
        var count = 0
        for j in i+1..<prices.count {
            count += 1
            if prices[i] > prices[j] { break }
        }
        result.append(count)
    }
    
    return result
}

// MARK: - O(n)
func solution3(_ prices:[Int]) -> [Int] {
    var stack: [Int] = []
    var result = Array(repeating: 0, count: prices.count)
    
    for i in 0..<prices.count {
        while !stack.isEmpty && prices[stack.last!] > prices[i] {
            result[stack.last!] = i - stack.last!
            stack.removeLast()
        }
        stack.append(i)
    }
    
    for index in stack {
        result[index] = prices.count - index - 1
    }
    
    return result
}

print(solution3([1, 2, 3, 2, 3]))
