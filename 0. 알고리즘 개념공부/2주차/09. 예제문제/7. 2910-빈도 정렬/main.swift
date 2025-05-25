//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 5/22/25.
//
// https://www.acmicpc.net/source/86083512

/*
 5 2
 2 1 2 1 2
 */

import Foundation

freopen("input.txt", "r", stdin)


//_ = readLine()
//let numbers = readLine()!.split(separator: " ").map { Int($0)! }
//var dic: [Int:Int] = [:]       // 숫자:개수
//var priority: [Int:Int] = [:] // 숫자:우선순위
//
//for (idx, num) in numbers.enumerated() {
//    if dic[num] == nil {
//        priority[num] = idx
//    }
//    dic[num, default: 0] += 1
//}
//
//// value가 많은순으로 키룰 정렬하는 방법
//let sortedKeys = dic.sorted {
//    // value가 같은 경우 order 배열의 인덱스로 비교
//    if $0.value == $1.value {
//        return priority[$0.key]! < priority[$1.key]!
//    }
//    return $0.value > $1.value
//}.map { $0.key }
//
//var output = ""
//for num in sortedKeys {
//    output += String(repeating: "\(num) ", count: dic[num]!)
//}
//print(output) // 2 2 2 1 1







//_ = readLine()
//let numbers = readLine()!.split(separator: " ").map { Int($0)! }
//var dic: [Int:Int] = [:]
//var order: [Int] = []
//
//for num in numbers {
//    if dic[num] == nil {
//        order.append(num) // [2, 1]
//    }
//    dic[num, default: 0] += 1
//}
//
//// value가 많은순으로 키룰 정렬하는 방법
//let sortedKeys = dic.sorted {
//    // value가 같은 경우 order 배열의 인덱스로 비교
//    if $0.value == $1.value {
//        // order.firstIndex(of:)!는 key가 order에서 몇번째 있는지 구함. 인덱스가 낮을수록 우선순위가 높음 > 방향이다.
//        return order.firstIndex(of: $0.key)! > order.firstIndex(of: $1.key)!
//    }
//    return $0.value > $1.value
//}.map { $0.key }
//
//var output = ""
//for num in sortedKeys {
//    output += String(repeating: "\(num) ", count: dic[num]!)
//}
//print(output) // 2 2 2 1 1





















//_ = readLine()
//let numbers = readLine()!.split(separator: " ").map { Int($0)! }
//
//// ── 1) 빈도 계산 / 순서 계산 ─────────────────────────────────────
//var dic: [Int:Int] = [:]
//var order: [Int:Int] = [:]
//for (idx, num) in numbers.enumerated() {
//    if dic[num] == nil {
//        order[num] = idx // num이 처음 등장한 idx 기록
//    }
//    dic[num, default: 0] += 1  // [num:value]
//}
//
//// ── 2) 빈도순으로 key 한번씩만 내보내기 ─────────────────────────────────────
//let keysByFreq = dic
//    .sorted {
//        if $0.value == $1.value {
//            // 먼저 나온 key가 앞으로 오도록 정렬
//            return order[$0.key]! < order[$1.key]!
//        } else {
//            return $0.value > $1.value // 내림차순
//        }
//    }
//    .map { $0.key }                   // key만 추출
//
//// ── 3) 빈도순으로 key를 빈도만큼 반복 출력 ─────────────────────────────────────
//var output: String = ""
//for num in keysByFreq {
//    output += String(repeating: "\(num) ", count: dic[num]!)
//}
//print(output)
//







//// ── 입력 ─────────────────────────────────────────────
//let _ = readLine()
//let numbers = readLine()!.split(separator: " ").map { Int($0)! }
//
//// ── 1) 빈도 계산 / 순서 계산 ─────────────────────────────────────
//var dic: [Int:Int] = [:]
//var order: [Int] = []
//for num in numbers {
//    if dic[num] == nil {
//        order.append(num)
//    }
//    dic[num, default: 0] += 1  // [num:value]
//}
//
//// ── 2) 빈도순으로 key 한번씩만 내보내기 ─────────────────────────────────────
//let keysByFreq = dic
//    .sorted {
//        if $0.value == $1.value {
//            // 먼저 나온 key가 앞으로 오도록 정렬
//            return order.firstIndex(of: $0.key)! < order.firstIndex(of: $1.key)! // < 더 먼저 등장한 숫자가 앞으로 오게
//        } else {
//            return $0.value > $1.value // 내림차순
//        }
//    }
//    .map { $0.key }                   // key만 추출
//
//// ── 3) 빈도순으로 key를 빈도만큼 반복 출력 ─────────────────────────────────────
//var output: [String] = []
//for num in keysByFreq {
//    output += Array(repeating: String(num), count: dic[num]!)
//}
//print(output.joined(separator: " "))
//

// ── 입력 ─────────────────────────────────────────────
//_ = readLine()
//let numbers = readLine()!.split(separator: " ").map { Int($0)! }
//
//// ── 1) 빈도 계산 / 순서 계산 ─────────────────────────────────────
//var dic: [Int:Int] = [:]
//var order: [Int] = []
//for num in numbers {
//    if dic[num] == nil {
//        order.append(num)
//    }
//    dic[num, default: 0] += 1  // [num:value]
//}
//
//// ── 2) 빈도순으로 key 한번씩만 내보내기 ─────────────────────────────────────
//let keysByFreq = dic
//    .sorted {
//        if $0.value == $1.value {
//            // 먼저 나온 key가 앞으로 오도록 정렬
//            return order.firstIndex(of: $0.key)! < order.firstIndex(of: $1.key)! // < 더 먼저 등장한 숫자가 앞으로 오게
//        } else {
//            return $0.value > $1.value // 내림차순
//        }
//    }
//    .map { $0.key }                   // key만 추출
//
//// ── 3) 빈도순으로 key를 빈도만큼 반복 출력 ─────────────────────────────────────
//var output: String = ""
//for num in keysByFreq {
//    output += String(repeating: "\(num) ", count: dic[num]!)
//}
//print(output)



//_ = readLine()
//var dic = [Int: (Int,Int)]()
//var ans = ""
//
//readLine()!.split { $0 == " " }.enumerated().forEach {
//    let n = Int(String($0.element))!
//    dic[n, default: ($0.offset, 0)].1 += 1
//}
//
//print(dic.sorted {
//    $0.value.1 != $1.value.1 ? $0.value.1 > $1.value.1 : $0.value.0 < $1.value.0
//}.map {
//    String(repeating: "\($0.key) ", count: $0.value.1)
//}.joined())
//



_ = readLine()

// [숫자: (등장 순서, 등장 횟수)]
var dic = [Int: (Int, Int)]()

let numbers = readLine()!.split(separator: " ").map { Int($0)! }

for (idx, num) in numbers.enumerated() {
    // 숫자 처음 등장시
    if dic[num] == nil {
        dic[num] = (idx, 1) // 등장순서, 1번 등장
    } else {
        dic[num]!.1 += 1   // 이미 등장한 숫자라면 횟수만 추가
    }
}

// 등장 횟수가 많은 숫자가 먼저 오도록, 같으면 등장순서가 빠른 순으로
let sorted = dic.sorted {
    let (firstIdx, firstCnt) = $0.value
    let (secondIdx, secondCnt) = $1.value
    
    if firstCnt != secondCnt {
        return firstCnt > secondCnt // 등장 횟수 많은 순
    } else {
        return firstIdx < secondIdx // 먼저 등장한 숫자 먼저
    }
}

// 출력 1
print(sorted.map { String(repeating: "\($0.key) ", count: $0.value.1) }.joined())

// 출력 2
var output = ""
for (number, (_, cnt)) in sorted {
    output += String(repeating: "\(number) ", count: cnt)
}
print(output)
