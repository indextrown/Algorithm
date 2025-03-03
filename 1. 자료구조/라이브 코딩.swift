//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 2/22/25.
//

/*
 
정수 배열 arr 가 주어집니다.
 
이 배열에는 각 숫자가 짝수 번 등장하지만, 오직 한 개의 숫자만 홀수 번 등장합니다.
 
배열을 "한 번만 순회 O(n)" 하여 홀수 번 등장하는 숫자를 찾아 출력하세요.
 
 */

// 입력
//let arr = [1, 1, 2, 9, 2, 3, 3]

// 출력
// 9

@main
struct Main {
    static func main() {
        
        let arr = [1, 1, 2, 9, 2, 3, 3]
        var result: Int = 0

        for num in arr { result ^= num }
        print(result)

    }
}

















//@main
//struct Main {
//    static func main() {
//
//        var result: Int = 0
//        arr.forEach { result ^= $0 }
//        print(result)
//    }
//}
//












//@main
//struct Main {
//    static func main() {
//        var dic: [Int : Bool] = [:]
//        
//        for num in arr {
//            if dic[num] == nil {
//                dic[num] = true
//            } else {
//                dic.removeValue(forKey: num)
//            }
//        }
//        
//        if let result = dic.keys.first {
//            print(result)
//        }
//    }
//}

//@main
//struct Main {
//    static func main() {
//        var dic: [Int: Int] = [:]
//        
//        for num in arr {
//            dic[num, default: 0] += 1
//        }
//        
//        for (num, count) in dic {
//            if count == 1 {
//                print(num)
//            }
//        }
//    }
//}

//@main
//struct Main {
//    static func main() {
//        
//        var temp: Int = 0
//        
//        for i in arr {
//            temp = temp ^ i
//        }
//        print(temp)
//    }
//}


