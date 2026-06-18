//
//  순열조합템플릿.swift
//  Algorithm
//
//  Created by 김동현 on 1/24/26.
//

import Foundation

// 순열
func permutationIndex(_ n: Int,
                      _ r: Int,
                      _ depth: Int,
                      _ arr: inout [Int]
) {
    if depth == r {
        print(Array(arr[0..<r]))
        return
    }
    
    for i in depth..<n {
        arr.swapAt(i, depth)
        permutationIndex(n, r, depth + 1, &arr)
        arr.swapAt(i, depth) // 백트래킹
    }
}

// 순열 + 실제 배열
//func permutation<T>(_ arr: inout [T],
//                    _ r: Int,
//                    _ depth: Int
//) {
//    if depth == r {
//        print(Array(arr[0..<r]))
//        return
//    }
//    
//    for i in depth..<arr.count {
//        arr.swapAt(i, depth)
//        permutation(&arr, r, depth + 1)
//        arr.swapAt(i, depth) // 백트래킹
//    }
//}
func permutation<T>(
    _ arr: inout [T],
    _ r: Int,
    _ depth: Int,
    _ visit: ([T]) -> Void
) {
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



// 조합
func combinationIndex(_ n: Int,
                      _ r: Int,
                      _ start: Int,
                      _ selected: inout [Int]
) {
    if selected.count == r {
        print(selected)
        return
    }
    
    for i in start..<n {
        selected.append(i)
        combinationIndex(n, r, i + 1, &selected)
        selected.removeLast()
    }
}

// 조합 + 실제배열
func combination<T>(_ arr: [T],
                    _ r: Int,
                    _ start: Int,
                    _ selected: inout [T]
) {
    if selected.count == r {
        print(selected)
        return
    }
    
    for i in start..<arr.count {
        selected.append(arr[i])
        combination(arr, r, i + 1, &selected)
        selected.removeLast()
    }
}

@main
struct Main {
    static func main() {
        var arr = Array(0..<4)   // [0, 1, 2, 3]
        permutationIndex(4, 2, 0, &arr)
        
        var fruits = ["🍎", "🍌", "🍇", "🍓"]
        permutation(&fruits, 2, 0)

        var selected: [Int] = []
        combinationIndex(4, 2, 0, &selected)

        var picked: [String] = []
        combination(fruits, 2, 0, &picked)
    }
}





// 고민되는것들
func permute(_ nums: [Int]) {
    var used = Array(repeating: false, count: nums.count)
    var path = [Int]()

    func dfs() {
        if path.count == nums.count {
            print(path)
            return
        }

        for i in 0..<nums.count {
            if used[i] { continue }
            used[i] = true
            path.append(nums[i])
            dfs()
            path.removeLast()
            used[i] = false
        }
    }

    dfs()
}

func nextPermutation<T: Comparable>(_ nums: inout [T]) -> Bool {
    let n = nums.count
    if n < 2 { return false }

    var i = n - 2
    while i >= 0 && nums[i] >= nums[i + 1] {
        i -= 1
    }

    if i < 0 {
        nums.reverse()
        return false
    }

    var j = n - 1
    while nums[j] <= nums[i] {
        j -= 1
    }

    nums.swapAt(i, j)
    nums[(i + 1)...].reverse()

    return true
}


/// 순열
/// - Parameters:
///   - arr: 순열을 만들 재료 배열 (계속 바뀜)
///   - r: 만들 순열 길이
///   - depth: 현재 고정 중인 자리
///   - visit: 순열 하나 완성됐을 때 실행할 코드
func permutation<T>(
    _ arr: inout [T],
    _ r: Int,
    _ depth: Int,
    _ visit: ([T]) -> Void
) {
    
    // 종료 조건
    if depth == r { /// 앞에서 r개 자리를 다 채웠다
        visit(Array(arr[0..<r])) /// 현재 만들어진 순열 -> 완성알림ArraySlice
        return
    }

    // 이번 자리(depth)에 누굴 놓을까?
    for i in depth..<arr.count {
        
        // i번째 값을 depth 자리에 놓기
        arr.swapAt(i, depth)
        
        // 다음 자리로 이동
        permutation(&arr, r, depth + 1, visit)
        
        // 백트래킹 (원상복구)
        arr.swapAt(i, depth)
    }
}

//permutation(&arr, 2, 0) { perm in
//    print(perm)
//}

func nextPermutation(_ nums: inout [Int]) -> Bool {
    let n = nums.count
    if n < 2 { return false }

    // 1. i 찾기
    var i = n - 2
    while i >= 0 && nums[i] >= nums[i + 1] {
        i -= 1
    }

    // 마지막 순열
    if i < 0 {
        nums.reverse()
        return false
    }

    // 2. j 찾기
    var j = n - 1
    while nums[j] <= nums[i] {
        j -= 1
    }

    // 3. swap
    nums.swapAt(i, j)

    // 4. 뒤집기
    nums[(i + 1)...].reverse()

    return true
}
//var nums = [1,2,3,4,5,6,7,8,9]
//
//repeat {
//    if nums.prefix(7).reduce(0, +) == 100 {
//        print(nums.prefix(7))
//        break
//    }
//} while nextPermutation(&nums)

func nextCombination(_ comb: inout [Int], n: Int) -> Bool {
    let k = comb.count

    var i = k - 1
    while i >= 0 && comb[i] == n - k + i {
        i -= 1
    }

    if i < 0 { return false }

    comb[i] += 1
    for j in i+1..<k {
        comb[j] = comb[j - 1] + 1
    }

    return true
}

//let arr = [1,2,3,4,5]
//let k = 3
//
//var comb = Array(0..<k)   // 초기 상태
//
//repeat {
//    print(comb.map { arr[$0] })
//} while nextCombination(&comb, n: arr.count)

