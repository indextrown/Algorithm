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


func solution(_ prices:[Int]) -> [Int] {
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

print(solution([1, 2, 3, 2, 3]))

