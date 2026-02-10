import Foundation
freopen("input.txt", "r", stdin)

var isValid = true
let input = readLine()!
var dic: [Character: Int] = [:]
var arr: [Int] = []
var result = ""
for char in input {
    dic[char, default: 0] += 1
}

var cnt = 0
for (key, value) in dic {

    // 홀수라면 출력
    if value % 2 != 0 {

        // 전 사이클로 홀수가 이미 1개 존재한다면
        if cnt == 1 {
            isValid = false
            break
        }
        arr.append(Int(key.asciiValue!))
        dic[key]! -= 1
        cnt += 1
    } 
}

if !isValid {
    print("I'm Sorry Hansoo")
} else {
    for (key, value) in dic.sorted(by: { $0.key > $1.key } ) {
        for _ in stride(from: 0, to: value, by: 2) {
            let v = Int(key.asciiValue!)
            arr.insert(v, at: 0)
            arr.append(v)
        }
    }

    for num in arr {
        result.append(String(Character(UnicodeScalar(num)!)))
    }
    print(result)
}



// import Foundation
// freopen("input.txt", "r", stdin)

// let input = readLine()!
// var cntArr: [Int] = Array(repeating: 0, count: 26)
// print(input)

// for ch in input {
//     let idx = Int(ch.asciiValue! - 65)
//     cntArr[idx] += 1
// }
// print(cntArr)