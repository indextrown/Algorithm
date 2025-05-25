//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 5/23/25.
//

import Foundation

freopen("input.txt", "r", stdin)

//let vowels = ["a", "e", "i", "o", "u"]
//while let input = readLine(), input != "end" {
//    
//    let temp = Set(input)
//    var inVowels = false
//
//    for v in vowels {
//        if temp.contains(v) {
//            inVowels = true
//        } 
//    }
//    
//    print(temp)
//    if inVowels {
//        print("모음 존재")
//    } else {
//        print("모음 없음")
//    }
//    
//    
//    print()
//}



//
//let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
//while let input = readLine(), input != "end" {
//    
//    let inputSet = Set(input)
//    
//    // 1. 모음이 하나라도 포함되어 있으면 통과
//    if !inputSet.intersection(vowels).isEmpty { // isDisjoint
//        
//        var vowelsCount = 0    // 모음
//        var consonantCount = 0 // 자음
//
//        // 2. 자음 3개나 모음 3개가 연속등장이 아니면 통과
//        for c in input {
//            if vowels.contains(c) {
//                // print("모음: \(c)")
//                vowelsCount += 1
//                consonantCount = 0
//            } else {
//                // print("자음: \(c)")
//                consonantCount += 1
//                vowelsCount += 1
//            }
//        }
//        
//        if vowelsCount == 3 || consonantCount == 3 {
//            // print("<\(input)> is not acceptable.")
//            
//            // 3. ee, oo를 제외한 같은 글자 연속이 아니면 통과
//            var prevC: Character = " "
//            for c in input {
//                if c == prevC {
//                    print("<\(input)> is not acceptable.")
//                    break
//                }
//                prevC = c
//            }
//        } else {
//            print("<\(input)> is acceptable.")
//        }
//    } else {
//        print("<\(input)> is not acceptable.")
//    }
//}

// 모음
//let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
//
//while let input = readLine(), input != "end" {
//    
//    let setInput: Set<Character> = Set(input)
//    
//    // 1. 모음 하나를 반드시 포함해야 통과
//    if setInput.intersection(vowels).isEmpty {
//        print("<\(input)> is not acceptable.")
//        continue
//    }
//    
//    // 2. 모음이 3개 혹은 자음이 3개 연속으로 오지 않으면 통과
//    var vCount = 0 // 모음 카운트
//    var cCount = 0 // 자음 카운트
//    var isBroken = false
//    
//    for char in input {
//        // 모음이라면
//        if vowels.contains(char) {
//            vCount += 1
//            cCount = 0
//        } else {
//            // 자음이라면
//            vCount = 0
//            cCount += 1
//        }
//        
//        if vCount >= 3 || cCount >= 3 {
//            print("<\(input)> is not acceptable.")
//            isBroken = true
//            break
//        }
//    }
//    
//    if isBroken { continue }
//
//    
//    // 3. 같은 글자가 연속적으로 두번 오면 안되나 ee, oo는 허용한다
//    var stop = false
//    
//    for idx in 1..<input.count {
//        if stop { break }
//        let before = input[input.index(input.startIndex, offsetBy: idx-1)]
//        let after = input[input.index(input.startIndex, offsetBy: idx)]
//        if before == after {
//            stop = true
//        }
//        if before == "e" && after == "e" || before == "o" && after == "o" {
//            stop = false
//        }
//    }
//    
//    if stop {
//        print("<\(input)> is not acceptable.")
//        continue
//    }
//    
//    print("<\(input)> is acceptable.")
//}



// 모음
let vowels: Set<Character> = (["a", "e", "i", "o", "u"])

while let input = readLine(), input != "end" {


    // 2. 모음이 3개 혹은 자음이 3개 연속으로 오지 않으면 통과
    var vCount = 0 // 모음 카운트
    var cCount = 0 // 자음 카운트
    var hasVowel = false
    var isBroken = false

    for char in input {
        if vowels.contains(char) {
            // 모음이라면
            hasVowel = true
            vCount += 1
            cCount = 0
        } else {
            // 자음이라면
            vCount = 0
            cCount += 1
        }

        if vCount >= 3 || cCount >= 3 {
            isBroken = true
            break
        }
    }

    // 1. 모음이 있거나 || 2. 자음 혹은 모음이 3개 연달아 오지 않으면 패스
    if !hasVowel || isBroken {
        print("<\(input)> is not acceptable.")
        continue
    }


    // 3. 같은 글자가 연속적으로 두번 오면 안되나 ee, oo는 허용
    var stop = false

    for idx in 1..<input.count {
        if stop { break }
        let before = input[input.index(input.startIndex, offsetBy: idx-1)]
        let after = input[input.index(input.startIndex, offsetBy: idx)]
        if before == after {
            stop = true
        }
        if before == "e" && after == "e" || before == "o" && after == "o" {
            stop = false
        }
    }

    if stop {
        print("<\(input)> is not acceptable.")
        continue
    }

    print("<\(input)> is acceptable.")
}

