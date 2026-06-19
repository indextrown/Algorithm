/*
- 2와 5로 나누어 떨어지지 않는 정수가(1 ≤ n ≤ 10000) 주어진다.
- 각 자릿수가 모두 1로만 이루어진 n의 배수를 찾는 프로그램을 만들자.

1 + 10
11 + 100
111 + 1000
1111
11111
*/


import Foundation
freopen("input.txt", "r", stdin)

while let input = readLine(), let num = Int(input) {
    var number = 1
    var count = 1

    while number % num != 0 {
        number = number * 10 + 1
        count += 1
    }

    print(String(number).count)
}