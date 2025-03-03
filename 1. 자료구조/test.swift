//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 2/27/25.
//

// sort -
// set - https://babbab2.tistory.com/114

import Foundation



//@main
//struct Main {
//    
//    static func main() {
//
//        freopen("input.txt", "r", stdin);
//        
//        let n = Int(readLine()!)!
//        var mySet: Set<String> = []
//        
//        let strCompar: (String, String) -> Bool = { (lhs, rhs) in
//            
//            // 2. 만약 길이가 같으면 사전순으로
//            if lhs.count == rhs.count {
//                return lhs < rhs
//            }
//            
//            // 1. 길이가 다르면 길이 비교
//            return lhs.count < rhs.count
//        }
//        
//        for _ in 0..<n { mySet.insert(readLine()!) }
//        mySet.sorted(by: strCompar).forEach { print($0) }
//        
//    }
//}
//





//@main
//struct Main {
//    
//    static func main() {
//
//        freopen("input.txt", "r", stdin);
//        
//        let n = Int(readLine()!)!
//        let mySet = Set((0..<n).map { _ in readLine()! })
//        // let mySet = Set((0..<n).compactMap { _ in readLine() })
//        
//        mySet.sorted {
//            $0.count == $1.count ? $0 < $1 : $0.count < $1.count
//        }
//        .forEach { print($0) }
//    }
//}


//@main
//struct Main {
//    
//    static func main() {
//
//        freopen("input.txt", "r", stdin);
//        
//        let n = Int(readLine()!)!
//        var wordArray = Array(repeating: [String](), count: 51)
//        
//        for _ in 0..<n {
//            let word = readLine()!
//            
//            if !wordArray[word.count].contains(word) {
//                wordArray[word.count].append(word)
//            }
//        }
//        
//        for i in 1..<51 {
//            wordArray[i].sorted().forEach {
//                print($0)
//            }
//        }
//    }
//}




@main
struct Main {

    static func main() {

        freopen("input.txt", "r", stdin);

        let n = Int(readLine()!)!
        let mySet = Set((0..<n).map { _ in readLine()! })

        mySet.sorted {
            $0.count == $1.count ? $0 < $1 : $0.count < $1.count
        }
        .forEach { print($0) }
    }
}

