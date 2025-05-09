//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/28/24.
//

import Foundation

/*
 
 map    각 요소를 변환하여 새로운 배열 생성.
 filter    조건을 만족하는 요소만 반환.
 reduce    배열을 결합하여 단일 값 생성.
 compactMap    nil 제거 후 변환.
 flatMap    중첩 배열을 단일 배열로 펼침.
 forEach    각 요소에 대해 작업 수행 (배열 변환 X).
 sort/sorted    배열을 정렬.
 contains    특정 요소 또는 조건 만족 여부 확인.
 allSatisfy    모든 요소가 조건을 만족하는지 확인.
 zip    두 배열을 결합해 튜플 배열 생성.
 
 */

func mains() {
    
    // MARK: - .map {} : 배열의 각 요소에 동일한 작업을 수행한 결과로 새로운 배열 반환
    let numbers = [1, 2, 3, 4, 5]
    
    // 2배로 만들기
    let doubled = numbers.map { $0 * 2 }
    print(doubled)
    
    // 문자열 배열로 반환
    let strings = numbers.map { "숫자: \($0)" }
    print(strings)
    
    // MARK: - .filter {} : 조건을 만족하는 요소만 포함되는 새로운 배열 반환
    let evens = numbers.filter { $0%2==0 }
    print(evens)
    
    // MARK: - .compactMap {} : nil을 제거하고, 나머지 요소를 변환하열 새로운 배열을 반환
    let newNumbers = ["1", "2", "three", "4", "5"]
    let validNumbers = newNumbers.compactMap { Int($0) }
    print(validNumbers)
    
    let optionalValues: [Int?] = [1, nil, 3, nil, 5]
    let noNilValues = optionalValues.compactMap { $0 }
    print(noNilValues)
    
    // MARK: - .flatMap {} : 중첩된 배열을 하나의 배열로 만든다
    let nestedArrays = [[1, 2, 3], [4, 5], [6, 7, 8]]
    
    // 중첩된 배열 펼치기
    let flattened = nestedArrays.flatMap { $0 }
    print(flattened)
    
    // MARK: - .forEach {} : 각 요소에 대해 특정 작업을 수행한다, 배열을 변환하지 않고 순회하며 작업을 수행한다.
    numbers.forEach { print($0) }
    
    // 짝수 여부 출력
    numbers.forEach { number in
        if number % 2 == 0 {
            print("\(number) is even")
        }
    }
    
    // MARK: - sort: 원본 배열을 정렬, sorted: 정렬된 새로운 배열 변환
    var numbers2 = [5, 4, 3, 2, 1]
    
    // 원본 배열 정렬
    numbers2.sort()
    print(numbers2)
    
    // 정렬된 새로운 배열 반환
    let sortedNumbers = numbers2.sorted { $0 > $1 }
    print(sortedNumbers)  // [5, 4, 3, 2 ,1]
    
    // MARK: - .contains {} : 배열에 특정 요소가 있는지 확인
    // 특정 값 확인
    let hasThree = numbers.contains(3)
    print(hasThree)
    
    // 조건으로 확인
    let hasEven = numbers.contains { $0 % 2 == 0 }
    print(hasEven)
    
    // MARK: - .allSatisfy {} : 모든 요소가 조건을 만족하는지 확인
    // 모든 요소가 짝수인지 확인
    let allEven = numbers.allSatisfy { $0 % 2 == 0 }
    print(allEven)
    
    // MARK: - 두 배열을 결합하여 튜플 배열을 생성
    let names = ["Index", "Jito"]
    let scores = [100, 90]
    
    // 이름과 점수 결합
    let paired = zip(names, scores)
    for pair in paired {
        print(pair)
    }
    
    // ("Index", 100)
    // ("Jito", 90)
    
}
