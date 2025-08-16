//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 8/15/25.
//

import Foundation

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var words: [String] = []
}

class SearchService {
    private var root = TrieNode()
    private var invertedIndex: [String: Set<String>] = [:] // n-gram 인덱스
    
    /// 키워드 추가
    /// 시간 복잡도: O(L) (L = 단어 길이)
    ///  - Trie 삽입: O(L)
    ///  - n-gram 인덱스 삽입: O(L)  (g=2일 경우 L-1개의 n-gram 생성)
    /// 전체: O(L) + O(L) → O(L)
    func addKeyword(_ word: String) {
        // Trie 삽입 (접두어 검색용)
        var node = root
        for char in word { // O(L)
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node.words.append(word) // O(1)
            node = node.children[char]!
        }
        node.words.append(word) // O(1)
        
        // Inverted Index 삽입 (중간 포함 검색용)
        let chars = Array(word)
        for i in 0..<chars.count-1 { // O(L)
            let key = String(chars[i...i+1]) // O(g) → g=2 상수
            invertedIndex[key, default: []].insert(word) // O(1) 평균
        }
    }
    
    /// 접두어 검색
    /// 시간 복잡도: O(m + k)
    ///  - m = 검색어 길이 (Trie 탐색)
    ///  - k = 결과 개수 (리턴할 words 배열 크기)
    func searchPrefix(_ prefix: String) -> [String] {
        var node = root
        for char in prefix { // O(m)
            guard let next = node.children[char] else { return [] }
            node = next
        }
        return node.words // O(k)
    }
    
    /// 중간 포함 검색
    /// 시간 복잡도: O(1 + k)
    ///  - 딕셔너리에서 substring 키로 바로 접근: O(1) 평균
    ///  - k = 해당 키워드 리스트 크기
    func searchContains(_ substring: String) -> [String] {
        return Array(invertedIndex[substring] ?? []) // O(k)
    }
}

@main
struct Main {
    static func main() {
        // 사용 예시
        let service = SearchService()
        service.addKeyword("apple")
        service.addKeyword("apricot")
        service.addKeyword("grape")
        service.addKeyword("banana")

        print(service.searchPrefix("ap"))    // ["apple", "apricot"]
        print(service.searchContains("ap"))  // ["apple", "apricot", "grape"]
    }
}
