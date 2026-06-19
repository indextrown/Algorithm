// strategy
protocol PaymentStrategy {
    func pay(amount: Int)    
}

// concrete strategy
class ApplePayStrategy: PaymentStrategy {
    func pay(amount: Int) {
        print("ApplePay로 \(amount)원 결제")
    }
}

class KakaoPayStrategy: PaymentStrategy {
    func pay(amount: Int) {
        print("KakaoPay로 \(amount)원 결제")
    }
}

class CardPayStrategy: PaymentStrategy {
    func pay(amount: Int) {
        print("카드로 \(amount)원 결제")
    }
}

// context
final class PaymentContext {
    private var strategy: PaymentStrategy

    init(strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func setStrategy(_ strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func pay(amount: Int) {
        strategy.pay(amount: amount)
    }
}

let applePay = ApplePayStrategy()
let kakaoPay = KakaoPayStrategy()

let payment = PaymentContext(strategy: applePay)
payment.pay(amount: 10000)

payment.setStrategy(kakaoPay)
payment.pay(amount: 20000)

// context 없는 버전
func pay(amount: Int, strategy: PaymentStrategy) {
    strategy.pay(amount: amount)
}
pay(amount: 10000, strategy: ApplePayStrategy())
pay(amount: 20000, strategy: KakaoPayStrategy())