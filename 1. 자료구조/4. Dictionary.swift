//
//  Dictionary.swift
//  Algorithm
//
//  Created by 김동현 on 6/26/25.
//

// MARK: - 왜 struct 안에 class를 쓰는가?

// ✅ struct = 값 타입 (복사됨)
// ✅ class  = 참조 타입 (공유됨)
// → struct 안에 class를 넣으면 복사할지 말지 **직접 제어 가능**해짐

// 📦 목적: 값 타입처럼 안전하게 사용하되,
//         실제 메모리는 공유하고, 필요한 순간에만 복사하는 "copy-on-write (COW)" 구현

// MARK: - Copy-on-Write (COW)의 핵심

/*
 Copy-on-Write란?

 1. struct끼리 복사할 땐 실제 복사하지 않고 참조만 공유함
 2. 수정하려고 할 때, 참조된 class가 나 혼자인지 확인
 3. 나 혼자가 아니면 -> 진짜 복사해서 분리
 4. 나 혼자면 -> 그냥 수정

 이렇게 하면:
 ✅ struct처럼 안전함 (값 타입의 불변성 보장)
 ✅ class처럼 빠름 (메모리 복사 최소화)

 Swift에서 제공하는 함수:
     isKnownUniquelyReferenced(&_storage)
 → 참조가 하나뿐이면 true (복사 불필요)
 → 참조가 여러 개면 false (복사 필요)
 */

import Foundation

protocol Dictionable {
    mutating func clear()
    func containsKey(_ key: String) -> Bool
    func get(_ key: String) -> String?
    func isEmpty() -> Bool
    func keys() -> [String]
    mutating func put(_ key: String, _ value: String)
    mutating func remove(_ key: String)
    func size() -> Int
}

struct HashMap: Dictionable {
    
    private var table: [[(key: String, value: String)]]
    
    // 테이블 크기
    private let tableSize: Int
    
    // 초기화
    init(tableSize: Int = 10) {
        self.tableSize = tableSize
        self.table = Array(repeating: [], count: tableSize)
    }
    
    /// 1. 곱셈 기반 해시
    /// 문자의 순서와 위치에 따라 다른값 생성된다
    /// - Parameter key: 해시 생성할 key
    /// - Returns: hash value(해시테이블 인덱스 정수값)
    private func hash(_ key: String) -> Int {
        var hashValue = 0
        for scalar in key.unicodeScalars {
            hashValue = (hashValue &* 31 &+ Int(scalar.value)) % tableSize
        }
        return hashValue
    }
    
    
    /// 2. 나누기 기반 해시
    /// abc와 cab가 같은 해시 값을 가져서 충돌 확률 증가한다
    /// - Parameter key: key
    /// - Returns: hash value
    func hash2(_ key: String) -> Int {
        var sum = 0
        
        // 문자열의 각 문자에 대해 아스키값 합산
        for char in key {
            sum += Int(char.asciiValue ?? 0)
        }
        
        // 테이블 크기로 나눈 나머지의 값을 반환
        let hashValue = sum % tableSize
        
        return hashValue
    }
    
    
    /// 키-값을 추가/업데이트
    /// - Parameters:
    ///   - key: 저장할 key
    ///   - value: 저장할 value
    mutating func put(_ key: String, _ value: String) {
        let index = hash(key)
        
        // 이미 존재하는 key이면 value 업데이트
        for chainIndex in 0..<table[index].count {
            if table[index][chainIndex].key == key {
                table[index][chainIndex].value = value // 기존값 덮어쓰기
                return
            }
        }
        
        // 없으면 새로 추가(체이닝)
        table[index].append((key, value))
    }
    
    
    /// key에 해당하는 동거자(key-value) 삭제
    /// - Parameter key: 삭제할 key
    mutating func remove(_ key: String) {
        let index = hash(key)
        
        // 해당 버킷이 비어있다면 삭제할 필요 x => 성능 향상을 위해 루프 순회 x
        if table[index].isEmpty { return }
        
        for chainIndex in 0..<table[index].count {
            if table[index][chainIndex].key == key {
                // 첫 번째 일치하는 항목만 삭제
                table[index].remove(at: chainIndex)
                break
            }
        }
    }
    
    
    /// key에 해당하는 value를 반환
    /// - Parameter key: 검색할 key
    /// - Returns: key에 해당하는 value, 없으면 nil
    func get(_ key: String) -> String? {
        let index = hash(key)
        for pair in table[index] {
            if pair.key == key {
                return pair.value
            }
        }
        return nil
    }
    
    
    /// 전체 테이블이 비어있는지
    /// - Returns: Bool
    func isEmpty() -> Bool {
        for bucket in table {
            if !bucket.isEmpty {
                return false
            }
        }
        return true
    }
    
    
    /// 전체 키 목록을 배열로 반환
    /// - Returns: Bool
    func keys() -> [String] {
        var keys: [String] = []
        for bucket in table {
            for pair in bucket {
                keys.append(pair.key)
            }
        }
        return keys
    }
    
    
    /// 테이블에 저장된 아이템 개수를 반환
    /// - Returns: 아이템 개수 합산
    func size() -> Int {
        var count = 0
        for bucket in table {
            count += bucket.count
        }
        return count
    }
    
    
    /// key가 딕셔너리에 존재하는지 확인
    /// - Parameter key: 검색할 key
    /// - Returns: Bool
    func containsKey(_ key: String) -> Bool {
        if get(key) != nil{
            return true
        }
        return false
    }
    
    
    /// 테이블 초기화
    mutating func clear() {
        table = Array(repeating: [], count: tableSize)
    }
}

extension HashMap {
    init(count: Int, loadFactor: Double = 0.75) {
        let size = max(1, Int(Double(count) / loadFactor))
        self.init(tableSize: size)
    }
}

struct SuperHsahMap<Key: Hashable, Value> {
    var capacity: Int {
        _storage.capacity
    }
    private class _Storage {
        var buckets: [[(key: Key, value: Value)]]
        var capacity: Int // 버킷배열 크기
        var count: Int = 0
        var loadFactor: Double
        
        init(capacity: Int, loadFactor: Double) {
            self.capacity = max(1, capacity)
            self.buckets = Array(repeating: [], count: capacity)
            self.loadFactor = loadFactor
        }
        
        // _Storage 클래스의 깊은 복사를 수행
        // Hash는 값 타입인데, 내부에 참조 타입이 있으면 변경 시 의도치 않게 공유됨. 복사로 해결
        // 변경 전 _ensureUniqueStorage()를 통해 "나만 쓰는 저장소인지" 확인하고, 아니면 복사함
        func copy() -> _Storage {
            let newStorage = _Storage(capacity: capacity, loadFactor: loadFactor)
            newStorage.buckets = self.buckets
            newStorage.count = self.count
            return newStorage
        }
        
        func hash(_ key: Key) -> Int {
            var hasher = Hasher()
            key.hash(into: &hasher)
            return abs(hasher.finalize() % capacity)
        }
        
        func put(_ key: Key, _ value: Value) {
            let index = hash(key)
            
            // 이미 존재하는 key이면 value 업데이트
            for chainIndex in 0..<buckets[index].count {
                if buckets[index][chainIndex].key == key {
                    buckets[index][chainIndex].value = value // 기존값 덮어쓰기
                    return
                }
            }
            
            // 없으면 새로 추가(체이닝)
            buckets[index].append((key, value))
            count += 1
        }
        
        func remove(_ key: Key) -> Value? {
            let index = hash(key)
            
            // 해당 버킷이 비어있다면 삭제할 필요 x => 성능 향상을 위해 루프 순회 x
            if buckets[index].isEmpty { return nil }
            
            for chainIndex in 0..<buckets[index].count {
                if buckets[index][chainIndex].key == key {
                    
                    // 첫 번째 일치하는 항목만 삭제
                    let removeElement = buckets[index].remove(at: chainIndex)
                    count -= 1
                    return removeElement.value
                }
            }
            return nil
        }
        
        // 기존 용량의 2배로 늘린 새 버킷 배열 생성
        // 기존 모든 키-값 쌍에 대해 새 해시값 계산
        // 새로운 버킷 인덱스에 맞게 모두 재배치
        // 기존 버킷 배열을 새 배열로 교체
        private func resize() {
            let newCapacity = capacity * 2
            var newBuckets = Array<[(key: Key, value: Value)]>(repeating: [], count: newCapacity)
            
            for bucket in self.buckets {
                for (key, value) in bucket {
                    var hasher = Hasher()
                    key.hash(into: &hasher)
                    let newIndex = abs(hasher.finalize()) % newCapacity
                    newBuckets[newIndex].append((key: key, value: value))
                }
            }
            self.capacity = newCapacity
            self.buckets = newBuckets
        }
    }
    
    private var _storage: _Storage
    
    public init(capacity: Int = 101, loadFactor: Double = 0.75) {
        self._storage = _Storage(capacity: capacity, loadFactor: loadFactor)
    }
    
    // 값 타입(struct) 안에 들어 있는 참조 타입(class)이 다른 곳과 공유되지 않도록 보장하는 함수
    // 필요한 경우에만 복사(copy)
    // "_storage가 현재 나 혼자만 쓰는 유일한 참조인지 확인해줘. 다른 곳에서도 이 클래스를 같이 참조하고 있으면 복사(copy)해!"
    /// wift의 struct는 값 타입이라 복사(copy-on-write) 되어야 하는데, 내부에 class(참조 타입)가 있으면 진짜 복사가 안 일어나고, 공유가 됩니다.그래서 put()이나 remove() 같은 변경 작업 전에 copy()를 강제로 해줘야:💥 실수로 다른 복사본에도 영향을 주는 일을 막을 수 있습니다.
    private mutating func _ensureUniqueStorage() {
        /*
         isKnownUniquelyReferenced는 "지금 이 _storage를 나만 쓰고 있니?" 물어봄
         다른 곳도 같이 참조 중이면? → deep copy 수행
         나 혼자만 참조 중이면? → 복사 없이 그대로 사용
         */
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _storage.copy()
        }
    }
    
    mutating func clear() {
        _ensureUniqueStorage()
        // clear 호출시에도 기존 loadFactor 유지
        self._storage = _Storage(capacity: _storage.capacity, loadFactor: _storage.loadFactor)
    }
    
    func containsKey(_ key: Key) -> Bool {
        let index = _storage.hash(key)
        return _storage.buckets[index].contains { $0.key == key }
    }
    
    func get(_ key: Key) -> Value? {
        let index = _storage.hash(key)
        return _storage.buckets[index].first(where: { $0.key == key })?.value
    }
    
    func isEmpty() -> Bool {
        return _storage.count == 0
    }
    
    func keys() -> [Key] {
        return _storage.buckets.flatMap { $0.map { $0.key } }
    }
    
    mutating func put(_ key: Key, _ value: Value) {
        _ensureUniqueStorage()
        _storage.put(key, value)
    }
    
    @discardableResult
    mutating func remove(key: Key) -> Value? {
        _ensureUniqueStorage()
        return _storage.remove(key)
    }
    
    func size() -> Int {
        return _storage.count
    }
}

func performanceTest() {
    let testCount = 100_000
    let keys = (0..<testCount).map { "key\($0)" }
    let values = (0..<testCount).map { "value\($0)" }
        
    for percent in stride(from: 5, to: 90, by: 10) {
        let loadFactor = Double(percent) / 100.0
        print("--- Load Factor: \(loadFactor) ---")
        var map = HashMap(count: testCount, loadFactor: loadFactor)
        let size = max(1, Int(Double(testCount) / loadFactor))
        print("size: \(size)")
        
        // MARK: - Put
        var start = CFAbsoluteTimeGetCurrent()
        for i in 0..<testCount {
            map.put(keys[i], values[i])
        }
        var duration = CFAbsoluteTimeGetCurrent() - start
        print("  - Put 시간:      \(String(format: "%.4f", duration))초")
        
        // MARK: - Get
        start = CFAbsoluteTimeGetCurrent()
        for i in 0..<testCount {
            _ = map.get(keys[i])
        }
        duration = CFAbsoluteTimeGetCurrent() - start
        print("  - Get 시간:      \(String(format: "%.4f", duration))초")
        
        // MARK: - Remove
        start = CFAbsoluteTimeGetCurrent()
        for i in 0..<testCount {
            map.remove(keys[i])
        }
        duration = CFAbsoluteTimeGetCurrent() - start
        print("  - Remove 시간:   \(String(format: "%.4f", duration))초")
    }
}

func performanceTest2() {
    let testCount = 100_000
    let keys = (0..<testCount).map { "key\($0)" }
    let values = (0..<testCount).map { "value\($0)" }
    
    print("--- Swift Dictionary ---")
    var swiftDic: [String: String] = [:]
    
    // MARK: - Put
    var start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        swiftDic[keys[i]] = values[i]
    }
    var duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Put 시간:      \(String(format: "%.4f", duration))초")
    
    // MARK: - Get
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        _ = swiftDic[keys[i]]
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Get 시간:      \(String(format: "%.4f", duration))초")

    // MARK: - Remove
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        swiftDic.removeValue(forKey: keys[i])
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Remove 시간:   \(String(format: "%.4f", duration))초")
    
    
    
    
    
    print("--- Custom Dictionary ---")
    let loadFactor = Double(75) / 100.0
    var map = HashMap(count: testCount, loadFactor: loadFactor)
    let size = max(1, Int(Double(testCount) / loadFactor))
    print("size: \(size)")
    
    // MARK: - Put
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        map.put(keys[i], values[i])
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Put 시간:      \(String(format: "%.4f", duration))초")
    
    // MARK: - Get
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        _ = map.get(keys[i])
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Get 시간:      \(String(format: "%.4f", duration))초")
    
    // MARK: - Remove
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        map.remove(keys[i])
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Remove 시간:   \(String(format: "%.4f", duration))초")
 
    
    
    
    print("--- SuperHsahMap (Copy-on-Write) ---")
    var superMap = SuperHsahMap<String, String>(capacity: size, loadFactor: loadFactor)
    print("size: \(superMap.capacity)") // 👈 여기 추가
    
    // MARK: - Put
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        superMap.put(keys[i], values[i])
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Put 시간:      \(String(format: "%.4f", duration))초")
    
    // MARK: - Copy-on-Write 테스트
//    var copiedMap = superMap
//    start = CFAbsoluteTimeGetCurrent()
//    copiedMap.put("newKey", "newValue") // 이 시점에 복사 발생 (COW)
//    duration = CFAbsoluteTimeGetCurrent() - start
//    print("  - Copy-on-Write 발생 시 Put: \(String(format: "%.4f", duration))초")
    
    // MARK: - Get
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        _ = superMap.get(keys[i])
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Get 시간:      \(String(format: "%.4f", duration))초")
    
    // MARK: - Remove
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        superMap.remove(key: keys[i])
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Remove 시간:   \(String(format: "%.4f", duration))초")

}

@main
struct Main {
    static func main() {
        performanceTest2()
    }
}
