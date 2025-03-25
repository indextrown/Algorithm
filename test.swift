//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 3/10/25.
//


class Account {
    var balance: Int = 0 {
        willSet(newValue) {
            print("잔액: \(balance) -> \(newValue) 변경 예정")
        }
        
        didSet(oldValue) {
            print("잔액: \(oldValue) -> \(balance) 변경 예정")
        }
    }
}

struct Account2 {
    var balance: Int = 0 {
        willSet(newValue) {
            print("잔액: \(balance) -> \(newValue) 변경 예정")
        }
        
        didSet(oldValue) {
            print("잔액: \(oldValue) -> \(balance) 변경 예정")
        }
    }
}

@main
struct Main {
    static func main() {
        // 클래스는 참조타입이다
        // 인스턴스를 상수(let)로 선언하면, 인스턴스가 참조하는 객체의 주소는 변경할 수 없지만, 해당 객체의 내부의 변수(var) 프로퍼티는 수정할 수 있다
        let myMoney = Account()
        myMoney.balance = 500
        myMoney.balance = 300
        
        // 구조체는 값타입이라 let선언을 하면 전체 구조체 인스턴스가 immutable된다
        // 즉 구조체 인스턴스를 상수(let)로 선언하면 내부 프로퍼티가 var로 선언되어 있더라도 인스턴스 자체가 상수여서 값을 변경할 수 없기 때문에 수정 시도가 에러를 발생시킨다
        var myMoney2 = Account2()
        myMoney2.balance = 500
        myMoney2.balance = 300
    }
}
