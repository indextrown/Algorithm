//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/13/25.
//
// https://dev-mandos.tistory.com/296

import Foundation

struct UnionFind {
    private var parent: [Int]
    private var rank: [Int]
    
    // k: 노드 번호의 최댓값
    // rank: 루트 노드의 정보
    init(k: Int) {
        self.parent = Array(0...k)
        self.rank = Array(repeating: 0, count: k + 1)
    }
    
    mutating func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    mutating func union(a: Int, b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        
        if rootA == rootB { return }
        
        // rank 기준으로 붙이기(높이가 낮은 것 같은 트리를 높이가 높을 것 같은 트리 밑에 붙인다
        // A트리가 B트리보다 얕다
        if rank[rootA] < rank[rootB] {
            parent[rootA] = rootB
        // A트리가 B트리보다 깊다
        } else if rank[rootA] > rank[rootB] {
            parent[rootB] = rootA
        // 두 트리의 추정치가 같다(아무거나 루트로)
        } else {
            parent[rootB] = rootA
            rank[rootA] += 1
        }
    }
    
    // 같은 집합인지 확인
    mutating func isConnected(_ a: Int, _ b: Int) -> Bool {
        return find(a) == find(b)
    }
}

func folucion(k: Int, operations:[[Character]]) -> [Bool] {
    var uf = UnionFind(k: k)
    var result: [Bool] = []
    
    for cmd in operations {
        let a = Int(String(cmd[1]))!
        let b = Int(String(cmd[2]))!
        
        switch cmd[0] {
        case "u": uf.union(a: a, b: b)
        case "f": result.append(uf.isConnected(a, b))
        default: break
        }
    }
    return result
}

let result = folucion(k: 3,
         operations: [
            ["u", "0", "1"],
            ["u", "1", "2"],
            ["f", "0", "2"],
         ])

let result2 = folucion(k: 4,
         operations: [
            ["u", "0", "1"],
            ["u", "2", "3"],
            ["f", "0", "1"],
            ["f", "0", "2"],
         ])

print(result)
print(result2)
