class Person {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func info() {
        print("이름: \(name), 나이: \(age)")
    }

    func levelUp() {
        self.age += 1
    }
}

// 객체(변수선언)
let people: Person 

// 인스턴스(메모리 할당)
people = Person(name: "홍길동", age: 27) 

// 메서드
people.info()   
people.levelUp()
people.info()
