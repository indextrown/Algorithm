//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/20/26.
//
// https://explorer89.tistory.com/168
// https://babbab2.tistory.com/92
/*
 배열
 - 연속적인 메모리에 데이터를 저장하며 각 요소는 인덱스를 통해 빠르게 접근 가능하다
 - 고정된 크기를 가지는 배열과 동적으로 변할 수 있는 배열이 존재한다
 - 배열에서 중간에 삽입하거나 삭제하는 경우 다른 요소들을 이동시켜야 하기 때문에 성능이 저하될 수 있다 O(n)
 
 */

import Foundation

var array1: [Int] = [1, 2, 3]
var array2: [Int] = Array(repeating: 0, count: 10)

// MARK: - 배열 갯수 확인
print(array1.count)
print(array1.isEmpty)
print()

// MARK: - 배열 요소 접근
// 1. Subscript 접근
print(array1[0])

// 2. 범위로 접근
print(array1[0...1])

// 3. 속성으로 접근
print(array1.first ?? "nil")
print(array1.last ?? "nil")
print()

// MARK: - 배열에 요소 추가하기
// 1. append
var array4 = [1, 2, 3]
array4.append(4)
array4.append(contentsOf: [5, 6, 7])

// 2. 중간에 추가
var array5 = [1, 2, 3]
array5.insert(0, at: 0)
array5.insert(contentsOf: [10, 20], at: 2)
