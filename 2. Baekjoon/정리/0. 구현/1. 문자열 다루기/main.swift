//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 8/21/25.
//

import Foundation

// Str -> Int
let str: String = "7"
let num = Int(str)!
print(num)

// Character -> Int
let c: Character = "c"
if let ascilValue = c.asciiValue {
    print(ascilValue)
}

// 문자 리터럴 → Int (ASCII 값)
let a = Character("A").asciiValue!
print(a)

// Int → Character
let ascilCode = 97
if let scalar = UnicodeScalar(ascilCode) {
    let b = Character(scalar)
    print(b)
}

