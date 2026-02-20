/*
- 자연수 A를 B번 곱한 수를 알고싶다
- 위의 결과에서 c로 나눈 나머지를 구해라

b가 짝수 8이라면
8 = 2 * 4
a^8 = a^(2*4)

b가 홀수 9라면
9 = 2 * 4 + 1
a^9 = a^(2*4+1)
    = a^(2*4) * a^1
    = a

[공식]
(a + b) % c = a % c + b % c
(a * b) % c = a % c * b % c
*/

// import Foundation

// freopen("input.txt", "r", stdin)

// func go(_ a: Int, _ b: Int, _ c: Int) -> Int {
//     if b == 1 { return a % c }

//     var half = go(a, b/2, c)
//     half = (half * half) % c
//     if b % 2 == 1 { half = (half * a) % c }
//     return half
// }

// let input = readLine()!.split(separator: " ").map { Int($0)! }
// let (a, b, c) = (input[0], input[1], input[2])
// let result = go(a, b, c)
// print(result)




/*
[worst case]
- 0.5초(대략 5천만 연산 가능)
- B가 21억이면 연산횟수 21억번.. 시간초과

[거듭제곱]
- 같은 수의 연속된 곱셈의 표현을 편하게 나타내고자 사용하는 방법
- 3을 8번 곱한 것을 3^8과 같이 표현
- 밑: 곱하는 수
- 지수: 몇번 곱하는 수


[아이디어]
A = 2, B = 11일 때
2를 11번 곱해야 하는데 이러면 시간 초과 날 수 있음

수학적으로 이렇게 가능
B가 짝수일 때
- A^10 = A^5 * A^5 = (A^5)^2

B가 홀수일 때
- A^11 = A * A^10

                2⁸
               /
             2⁴
            /
          2²
         /
       2¹

[재귀 특징]
- 호출부터 아래로 쭉 내려가고 연산과 return은 리프부터 위로 올라오면서 실행된다  
- A^b를 계산할 때 b를 매번 b/2로 줄이므로
- 재귀 깊이는 log₂(b)이고
- 전체 시간복잡도는 O(log b)이다.

[일반화]
A = 2
B = 16

2^16을 구해야 한다
16은 2^4이다
연산 횟수 = log2​(16)= 4
- 어떤 수를 몇번 나누면 1이 되는가는 그 수의 로그 값과 같다
*/


/*
[강의 풀이]
go(2, 64)
-> go(2, 32)
-> go(2, 16)
-> go(2, 8)
-> go(2, 4)
-> go(2, 2)
-> go(2, 1)

6번곱함
log2(64) = 6
*/
import Foundation
freopen("input.txt", "r", stdin)

// 어떤 수를 몇번 나누면 1이 되는가는 그 수의 로그 값과 같다
// 로그는 곱한 횟수이자 나눈 횟수다
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b, c) = (input[0], input[1], input[2])

func go(_ a: Int, _ b: Int, _ c: Int) -> Int {
    // 기저사례
    if b == 1 { return a % c }

    var half = go(a, b/2, c)
    half = (half * half) % c
    if b % 2 == 1 { half = (half * a) % c }
    return half
}

var result = go(a, b, c)
print(result)