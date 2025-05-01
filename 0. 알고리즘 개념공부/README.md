# 알고리즘 기본 셋팅

### 1. 한 줄 문자열로 입력받기
```swift
let input = readLine()! 
print(input) // hello
```

### 2. 숫자 한 개 입력받기
```swift
Int(readLine()!)! 
```

### 3. 문자열을 배열로 입력받기
```swift
let input = Array(readLine()!)
print(input) // ["h", "e", "l", "l", "o"]
```

### 4. 한 줄에 공백으로 들어오는 숫자 입력받기
```swift
readLine()!.split(separator: " ").map { Int($0)! }
```

### 5. 한 줄에 separator로 들어오는 숫자 입력받기
```swift
readLine()!.split(separator: ",").map { Int($0)! }
```

### 6. EOF 나오기 전까지 무한으로 입력받기
```swift
while let input = readLine() {
    print(input)
}
```

### 7. 입력을 String 배열로 받기
```swift
readLine()!.map { String($0) }
```

### 8. 한 줄에 입력이 다닥다닥 붙어 있고, 한 글자씩 떼어 Int로 만들어야 할 때
```swift
readLine()!.map { Int(String($0))! }
```

### 9. 개행 없이 출력하기
```swift
print("hello world", terminator: "")
```

### 10. 특정 문자를 N번 반복하기
```swift
String(repeating: "*", count: N)
```

### 11. 조건에 맞지 않을 때 바로 exit하기
guard N > 1 else { exit(0) }

### 12. 배열에서 특정 값 포함 여부 확인 (O(N))
```swift
let array = [1, 2, 3, 4]
print(array.contains(3)) // true
```

### 13. Set에서 특정 값 포함 여부 확인 (O(1))
```swift
let set: Set = [1, 2, 3, 4]
print(set.contains(3)) // true
```

### 14. 2차원 배열 초기화
```swift
let rows = 3, cols = 4
var matrix = Array(repeating: Array(repeating: 0, count: cols), count: rows)
```

### 15. 배열 정렬
```swift
let sorted = array.sorted()        // 오름차순
let reversed = array.sorted(by: >) // 내림차순
```

### 16. 배열 중복 제거
```swift
let array = [1, 2, 2, 3]
let unique = Array(Set(array))
```

### 17. 딕셔너리 기본값 사용하기
```swift
var dict: [String: Int] = [:]
dict["apple", default: 0] += 1
```

### 18. 문자열 -> Int 안전하게 하기
```swift
if let number = Int("123") {
    print(number) // 123
}
```

### 19. 문자열 자르기 (prefix, suffix)
```swift
let str = "abcdef"
print(str.prefix(3)) // "abc"
print(str.suffix(2)) // "ef"
```

### 20. Character -> ASCII코드
```swift
let ch: Character = "A"
let ascii = Int(ch.asciiValue!) // 65
```

### 21. Bool을 Int로 변환
```swift
let flag = true
let num = flag ? 1 : 0
```
### 22. Zip으로 두 배열 묶기
```swift
let a = [1, 2, 3], b = ["a", "b", "c"]
for (num, str) in zip(a, b) {
    print(num, str)
}
```

### 23. 문자열 비교 (==, <, > 모두 가능)
```swift
print("apple" < "banana") // true
```

### 24. String에서 인덱스로 접근
```swift
let str = "hello"
let index = str.index(str.startIndex, offsetBy: 1)
print(str[index]) // "e"
```

### 25. 딕셔너리 정렬
```swift
let dict = ["b": 2, "a": 1]
let sorted = dict.sorted { $0.key < $1.key } // key 기준 정렬
```

### 26. 최대/최소
```swift
arr.max() ?? 0
arr.min() ?? 0
```

### 27. 합계
```swift
arr.reduce(0, +)
```

### 28. 절댓값
```swift
abs(-10)
```

### 29. 제곱/제곱근
```swift
pow(2.0, 3.0)    // 8.0
sqrt(9.0)        // 3.0
```

### 30. 나눗셈 (소수 결과)
```swift
let result = Double(a) / Double(b)
```

### 31. 최대값 위치 찾기
```swift
let maxValue = arr.max()!
let maxIndex = arr.firstIndex(of: maxValue)!
```

### 32. 빈도수 세기 (문자 기준)
```swift
var freq = Array(repeating: 0, count: 26)
for ch in str {
    let index = Int(ch.asciiValue! - Character("a").asciiValue!)
    freq[index] += 1
}
```

### 33. BFS(Queue)
```swift
import Foundation

func bfs(start: Int) {
    var visited = Array(repeating: false, count: N)
    var queue = [start]
    visited[start] = true

    while !queue.isEmpty {
        let now = queue.removeFirst()
        for next in graph[now] {
            if !visited[next] {
                visited[next] = true
                queue.append(next)
            }
        }
    }
}
```

### 33. DFS (재귀)
```swift
func dfs(_ node: Int) {
    visited[node] = true
    for next in graph[node] {
        if !visited[next] {
            dfs(next)
        }
    }
}
```

### 35. 튜플 정렬
```swift
let arr = [(1, 2), (3, 1), (2, 2)]
let sorted = arr.sorted { $0.1 < $1.1 }
```

### 36. 구조체 정렬
```swift
struct Person {
    let name: String
    let score: Int
}

let people = [Person(name: "A", score: 90), Person(name: "B", score: 80)]
let sorted = people.sorted { $0.score > $1.score }
```

### 39. Queue 구현 (Double Stack 방식 – 효율적)
```swift
struct Queue<T> {
    private var enqueue: [T] = []  // 들어오는 곳
    private var dequeue: [T] = []  // 나가는 곳

    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }

    var count: Int {
        return enqueue.count + dequeue.count
    }

    mutating func push(_ element: T) {
        enqueue.append(element)
    }

    mutating func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }

    func peek() -> T? {
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
    }
}
```

## Refetence
- https://dev-with-precious-dreams.tistory.com/223
- https://didu-story.tistory.com/177