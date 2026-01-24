//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 9/13/25.
//

/*
 https://nasneyland.tistory.com/13
 https://devyul.tistory.com/129
 https://bibi6666667.tistory.com/430
 */
import Foundation
//
//// MARK: - 순열
//func permutations<T>(_ arr: [T], _ r: Int, _ picked: [T] = [], _ visited: inout [Bool]) {
//    if picked.count == r {
//        print(picked)
//        return
//    }
//    
//    for i in 0..<arr.count {
//        if visited[i] { continue }
//        visited[i] = true
//        permutations(arr, r, picked + [arr[i]], &visited)
//        visited[i] = false
//    }
//}
//
//// MARK: - 조합
//func combinations<T>(_ arr: [T], _ r: Int, _ index: Int = 0, _ picked: [T] = []) {
//    if picked.count == r {
//        print(picked)
//        return
//    }
//    if index >= arr.count { return }
//    
//    // 현재 원소를 포함하는 경우
//    combinations(arr, r, index + 1, picked + [arr[index]])
//    
//    // 현재 원소를 포함하지 않는 경우
//    combinations(arr, r, index + 1, picked)
//}
//
//// 실행 예시
//let arr = [1, 2, 3, 4]
//var visited = Array(repeating: false, count: arr.count)
//
//print("👉 순열 (2개 뽑기)")
//permutations(arr, 4, [], &visited)
//
//print("\n👉 조합 (2개 뽑기)")
//combinations(arr, 2)


// https://nasneyland.tistory.com/13
// MARK: - 순열
//func permutations<T>(_ arr: [T], _ r: Int) -> [[T]] {
//    var result: [[T]] = []
//    var visited = Array(repeating: false, count: arr.count)
//    
//    func backtrack(_ picked: [T]) {
//        if picked.count == r {
//            result.append(picked)
//            return
//        }
//        
//        for i in 0..<arr.count {
//            if visited[i] { continue }
//            visited[i] = true
//            backtrack(picked + [arr[i]])
//            visited[i] = false
//        }
//    }
//    
//    backtrack([])
//    return result
//}

// MARK: - 조합
//func combinations<T>(_ arr: [T], _ r: Int) -> [[T]] {
//    var result: [[T]] = []
//    
//    func backtrack(_ index: Int, _ picked: [T]) {
//        if picked.count == r {
//            result.append(picked)
//            return
//        }
//        
//        if index >= arr.count { return }
//        backtrack(index + 1, picked + [arr[index]]) // 포함
//        backtrack(index + 1, picked)                // 미포함
//    }
//    
//    backtrack(0, [])
//    return result
//}

//print("순열:", permutations(arr, 2))
//print("조합:", combinations(arr, 2))

func permu<T>(_ targetArr: [T], _ targetNum: Int) -> [[T]] {
    var result: [[T]] = []
    var used = Array(repeating: false, count: targetArr.count)
    
    func dfs(_ arr: [T]) {
        if arr.count == targetNum {
            result.append(arr)
            return
        }
        
        for i in 0..<targetArr.count {
            if !used[i] {
                used[i] = true
                dfs(arr + [targetArr[i]])
                used[i] = false
            }
        }
    }
    dfs([])
    return result
}

func combi<T>(_ targetArr: [T], _ targetNum: Int) -> [[T]] {
    var result: [[T]] = []
    
    func dfs(_ index: Int, _ arr: [T]) {
        if arr.count == targetNum {
            result.append(arr)
            return
        }
        
        for i in index..<targetArr.count {
            dfs(i+1, arr + [targetArr[i]])
        }
    }
    
    dfs(0, [])
    return result
}

/*
@main
struct Main {
    static func main() {
        /*
         조합: [[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]]
         순열: [[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 2], [1, 3, 4], [1, 3, 5], [1, 4, 2], [1, 4, 3], [1, 4, 5], [1, 5, 2], [1, 5, 3], [1, 5, 4], [2, 1, 3], [2, 1, 4], [2, 1, 5], [2, 3, 1], [2, 3, 4], [2, 3, 5], [2, 4, 1], [2, 4, 3], [2, 4, 5], [2, 5, 1], [2, 5, 3], [2, 5, 4], [3, 1, 2], [3, 1, 4], [3, 1, 5], [3, 2, 1], [3, 2, 4], [3, 2, 5], [3, 4, 1], [3, 4, 2], [3, 4, 5], [3, 5, 1], [3, 5, 2], [3, 5, 4], [4, 1, 2], [4, 1, 3], [4, 1, 5], [4, 2, 1], [4, 2, 3], [4, 2, 5], [4, 3, 1], [4, 3, 2], [4, 3, 5], [4, 5, 1], [4, 5, 2], [4, 5, 3], [5, 1, 2], [5, 1, 3], [5, 1, 4], [5, 2, 1], [5, 2, 3], [5, 2, 4], [5, 3, 1], [5, 3, 2], [5, 3, 4], [5, 4, 1], [5, 4, 2], [5, 4, 3]]
         */
        let arr = [1, 2, 3, 4, 5]
        
        let runner = BenchmarkRunner(
            Benchmark(name: "순열 테스트") {
                return {
                    // print("순열:", permu(arr, 3))
                    _ = permu(arr, 3)
                }
            },
            Benchmark(name: "조합 테스트") {
                return {
                    // print("조합:", combi(arr, 3))
                    _ = combi(arr, 3)
                }
            }
        )
        runner.run()
    }
}
*/



/*
 순서와 상관 0 뽑는다면 -> 순열
 - nPr = n개중에 r개를 순서 고려해서 뽑겠다 = n!/(n-r)!
 순사와 상관 X 뽑는다면 -> 조합
 - n개 중에서 r개를 순서 상관없이 뽑는다 n!/r!(n-r)!
 
 문제
 - 순서를 재배치하여
 - ~한 순서의 경우 max 값을
 -> 순열
 
 ex) 1, 2, 3 중 3개 뽑기
 - 순서와 관계 없이 뽑는다면(조합) = {1, 2, 3}
 - 순서와 관계 있이 뽑는다면(순열)
    = {1, 2, 3}, {1, 3, 2}, {2, 1, 3}, {2, 3, 1}, {3, 1, 2}, {3, 2, 1}
 */


func makePermutation(_ n: Int, _ r: Int, _ depth: Int, arr: inout [Int]) {
    if r == depth {
        print(Array(arr[0..<r]))
        return
    }
    
    for i in depth..<n {
        arr.swapAt(i, depth)
        makePermutation(n, r, depth + 1, arr: &arr)
        arr.swapAt(i, depth)
    }
    return
}

func makeCombination(
    _ n: Int,
    _ r: Int,
    _ start: Int,
    selected: inout [Int]
) {
    if selected.count == r {
        print(selected)
        return
    }

    for i in start..<n {
        selected.append(i)
        makeCombination(n, r, i + 1, selected: &selected)
        selected.removeLast() // 백트래킹
    }
}

@main
struct Main {
    static func main() {
        var selected: [Int] = []
        makeCombination(4, 2, 0, selected: &selected)
    }
}

/*
func makeCombination(
    _ n: Int,
    _ r: Int,
    _ start: Int,
    _ depth: Int,
    arr: [Int],
    selected: inout [Int]
) {
    if depth == r {
        print(selected)
        return
    }

    for i in start..<n {
        selected.append(arr[i])
        makeCombination(n, r, i + 1, depth + 1, arr: arr, selected: &selected)
        selected.removeLast()
    }
}

func combination(
    _ arr: [Int],
    _ r: Int,
    _ start: Int,
    _ selected: inout [Int]
) {
    if selected.count == r {
        print(selected)
        return
    }

    for i in start..<arr.count {
        selected.append(arr[i])
        combination(arr, r, i + 1, &selected)
        selected.removeLast() // 백트래킹
    }
}


@main
struct Main {
    static func main() {
        var arr = [1, 2, 3, 4, 5]
        makePermutation(5, 3, 0, arr: &arr)
        
        var selected: [Int] = []
        makeCombination(5, 3, 0, 0, arr: arr, selected: &selected)
    }
}

*/
