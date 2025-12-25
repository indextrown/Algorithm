//
//  연계문제.swift
//  Algorithm
//
//  Created by 김동현 on 12/13/25.
//

import Foundation

struct UnionFind {
    private var parent: [Int]
    private var rank: [Int]
    
    init(n: Int) {
        self.parent = Array(0...n)
        self.rank = Array(repeating: 0, count: n+1)
    }
    
    mutating func find(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    mutating func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        
        if rootA == rootB { return }
        
        if rank[rootA] < rank[rootB] {
            parent[rootA] = rootB
        } else if rank[rootA] > rank[rootB] {
            parent[rootB] = rootA
        } else {
            parent[rootB] = rootA
            rank[rootA] += 1
        }
    }
    
    mutating func isConnected(_ a: Int, _ b: Int) -> Bool {
        return find(a) == find(b)
    }
}


@main
struct Main {
    static func main() {
        
        freopen("input.txt", "r", stdin)
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (input[0], input[1])
        var uf = UnionFind(n: n)
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let (cmd, a, b) = (input[0], input[1], input[2])
            
            switch cmd {
            case 0: uf.union(a, b)
            case 1: print(uf.isConnected(a, b) ? "YES" : "NO")
            default: break
            }
        }
    }
}
