protocol AttackStrategy {
    func attack()
}

// 기본 공격을 쓰는 전략
class BasicAttackStrategy: AttackStrategy {
    func attack() {
        print("기본 공격!")
    }
}

// 스킬 공격을 쓰는 전략
class SkillAttachStrategy: AttackStrategy {
    func attack() {
        print("스킬 공격!")
    }
}

// 궁극기 공격을 쓰는 전략
class UltimateAttackStrategy: AttackStrategy {
    func attack() {
        print("궁극기 공격!")
    }
}

// 소환사 주문 공격을 쓰는 전략
class SpellAttackStrategy: AttackStrategy {
    func attack() {
        print("소환사 주문 공격!")
    }
}

// 게임 캐릭터
class ChampionCharacter {
    private var attackStrategy: AttackStrategy?

    func setAttackStrategy(_ attackStrategy: AttackStrategy) {
        self.attackStrategy = attackStrategy
    }

    func execute() {
        self.attackStrategy?.attack()
    }
}

// 기본 공격 전략을 먼저 채택
let champion = ChampionCharacter()
champion.setAttackStrategy(BasicAttackStrategy())
champion.execute() // 기본 공격!

// 스킬 공격 전략으로 변경
champion.setAttackStrategy(SkillAttachStrategy())
champion.execute() // 스킬 공격!

// 궁극기 공격 전략으로 변경
champion.setAttackStrategy(UltimateAttackStrategy())
champion.execute() // 궁극기 공격!

// 궁극기 공격 전략으로 변경
champion.setAttackStrategy(SpellAttackStrategy())
champion.execute() // 소환사 주문 공격!
