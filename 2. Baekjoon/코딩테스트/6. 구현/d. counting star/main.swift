/*
[카운팅배열 유형]
https://www.acmicpc.net/problem/10808

Counting Star는 Map 또는 배열

map
- String 기번

array
- Integer 기반

반례
- Integer일 때 문제에서 주어지는 숫자가 1000만... 요소 자체가 꽉차게 들어오지 않고 띄엄띄엄 들어올때(sparse)
- 배열 1000만 정의하면 공간복잡도 초과로 공간할당이 안됨

let a: Character = "a"
print(a.asciiValue!)

let num = 97
let ch = Character(UnicodeScalar(num)!)
print(ch)   // a

아래 문제
- 문자열 기반으로 문자를 카운팅하는 문제 -> array
- 문자는 아스키코드로 숫자로 나타낼 수 있다
- A: 65
- a: 97
*/

import Foundation

freopen("input.txt", "r", stdin)

let word = readLine()!
var arr = Array(repeating: 0, count: 26)

word.forEach { char in
    let idx = Int(char.asciiValue! - 97)
    arr[idx] += 1
}

arr.forEach { print($0, terminator: " ") }

