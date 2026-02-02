## 제목: 순열과 조합

## 내용
순서와 상관 있게 뽑는다면 -> 순열
순서와 상관 없게 뽑는다면 -> 조합

### 예시1
ex) 문제에서 아래의 경우 순열
- 순서를 재배치하여..
- ~한 순서의 경우 max 값을(a, b, c 중 최대값 or a, c, d 중 max값) 

### 예시2
{1, 2, 3} 중 2개를 뽑는 경우
- 순열: (1, 2), (2, 1), (1, 3), (3, 1), (2, 3), (3, 2)
- 조합: (1, 2), (2, 3), (1, 3) -> 총 3게

### 공식
```swift
순열: nPr = n!/(n-r)! 
    - 3개중에 1개 뽑기: 3P1 = 3
    - 3개중에 2개 뽑기: 3P2 = 6
    
조합: nCr = n!/r!(n-r)!
    - 5개중에 3개 뽑기: 5C3 = 5C2 = 10
```

### 순열 템플릿
```swift
/// 순열
/// - Parameters:
///   - arr: 순열을 만들 재료 배열 (계속 바뀜)
///   - r: 만들 순열 길이
///   - depth: 현재 고정 중인 자리
///   - visit: 순열 하나 완성됐을 때 실행할 코드
func permutation<T>(_ arr: inout [T], _ r: Int, _ depth: Int, _ visit: (([T]) -> Void)) {
    
    if depth == r {
        visit(Array(arr[0..<r]))
        return
    }
    
    for i in depth..<arr.count {
        arr.swapAt(i, depth)
        permutation(&arr, r, depth + 1, visit)
        arr.swapAt(i, depth)
    }
}

// 예시
var arr = [1, 2, 3]
permutation(&arr, 2, 0) { perm in
    print(perm)
}
```

```swift
// 순열 활용
@discardableResult
func permutation<T>(_ arr: inout [T], _ r: Int, _ depth: Int, _ visit: (([T]) -> Bool)) -> Bool {
    
    if depth == r {
        return visit(Array(arr[0..<r]))
    }
    
    for i in depth..<arr.count {
        arr.swapAt(i, depth)
        if permutation(&arr, r, depth + 1, visit) { return true }
        arr.swapAt(i, depth)
    }
    
    return false
}

// 예시
var arr = [1, 2, 3]
permutation(&arr, 2, 0) { perm in
    print(perm)
    
    if perm == [1, 2] {
        print("정지")
        return true
    }
    return false
}
```

### 조합 템플릿
```swift
/// 조합
/// - Parameters:
///   - arr: 조합을 만들 원본 배열 (순서는 유지되며, 조합에서는 순서가 의미 없음)
///   - r: 선택할 원소의 개수
///   - start: 다음에 선택할 수 있는 시작 인덱스
///   - selected: 현재까지 선택된 원소들을 담는 배열(DFS 과정에서 append / removeLast로 관리됨)
///   - visit: r개의 원소가 모두 선택되었을 때 호출되는 클로저
func combi<T>(_ arr: [T], _ r: Int, _ start: Int, _ selected: inout [T],_ visit: ([T]) -> Void) {
    
    // r개 다 뽑았으면
    if selected.count == r {
        visit(selected)
        return
    }
    
    // 뒤에서 r개 못 채우면 중단(가지치기)
    for i in start..<arr.count {
        selected.append(arr[i])
        combi(arr, r, i+1, &selected, visit)
        selected.removeLast()
    }
}

// 예시
let arr = [1, 2, 3]
var selected: [Int] = []
combi(arr, 2, 0, &selected) { comb in
    print(comb)
}
```

```swift
// 조합 반복문 방식
let arr = [1, 2, 3]

for i in 0..<arr.count {
    for j in 0..<i {
        for k in 0..<j {
            print("\(arr[i]) \(arr[j]) \(arr[k])")
        }
    }
}

```

## 📚 새롭게 알게된 내용
<!-- 새롭게 알게된 내용이 있다면 작성 해주시고 출처를 남겨주세요. -->

