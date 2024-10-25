//
//  permutation.swift
//  Algorithm
//
//  Created by 김동현 on 10/17/24.
//

import Foundation

@main
struct Main {
    static func main() {
        for i in permute([1, 2, 3]) {
            print(i)
        }
        
        // 언제 forEach를 쓰지 말아야 하는가?
        // 중간에 반복을 종료해야 하거나 (break) 특정 요소를 건너뛰어야 할 때 (continue).
        // 성능이 매우 중요한 코드에서 클로저 오버헤드가 문제가 될 때.
        permute([1, 2, 3]).forEach { print($0) }
        
    }
}


func permute(_ nums: [Int]) -> [[Int]] {
  // 중복을 허용하지 않게 만들어야 하므로 아래와 같이 사용여부를 체크해줍니다.
  var result: [[Int]] = []
  var visited: [Bool] = [Bool](repeating: false, count: nums.count)
  
  // 만약 현재 순열의 원소 수가 주어진 원소수와 같다면 결과에 추가!
  func permutation(_ nowPermute: [Int]) {
    if nowPermute.count == nums.count {
      result.append(nowPermute)
      return
    }
    
    // 이미 사용한 값이라면 넘어갑니다.
    for i in 0..<nums.count {
      if visited[i] {
        continue
      } else {
        visited[i] = true
        permutation(nowPermute + [nums[i]])
        visited[i] = false
      }
    }
  }
  
  permutation([])
  return result
}

func combination(_ targetArr: [String], _ targetNum: Int, _ index: Int, _ arr: [String]) {
  if arr.count == targetNum {
    print(arr)
    return
  }
  
  for i in index..<targetArr.count {
    combination(targetArr, targetNum, i+1, arr + [targetArr[i]])
  }
}

// https://blog.slarea.com/algorithm/techniques/swift-permuation/
// https://jerry311.tistory.com/59
// https://velog.io/@loinsir/Swift-순열과-조합-구현하기
// https://hyeon-dev.tistory.com/entry/Swift-라이노-님의-FileIO-코드-분석하기
// https://gist.github.com/JCSooHwanCho



// https://jeonyeohun.tistory.com/265
// https://im-gu-ma.tistory.com/120
