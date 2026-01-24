//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/31/25.
//
// https://babbab2.tistory.com/136

import Foundation

//func swap(_ a :inout Int, _ b: inout Int) {
//    let temp = a
//    a = b
//    b = temp
//}
//
//var a = 10
//var b = 20
//
//swap(&a, &b)
//
//print(a, b)

func swapGeneric<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = "hello"
var b = "world"
print(a, b)
swapGeneric(&a, &b)
print(a, b)
