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
class SkillAttackStrategy: AttackStrategy {
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

enum AttackType {
    case basic
    case skill
    case ultimate
    case spell
}

// 게임 캐릭터
class ChampionCharacter {

    func attack(_ type: AttackType) {

        let strategy: AttackStrategy

        switch type {
        case .basic:
            strategy = BasicAttackStrategy()
        case .skill:
            strategy = SkillAttackStrategy()
        case .ultimate:
            strategy = UltimateAttackStrategy()
        case .spell:
            strategy = SpellAttackStrategy()
        }

        strategy.attack()
    }
}

// 기본 공격 전략을 먼저 채택
let champion = ChampionCharacter()
champion.attack(.basic) // 기본 공격!

// 스킬 공격 전략으로 변경
champion.attack(.skill) // 스킬 공격!

// 궁극기 공격 전략으로 변경
champion.attack(.ultimate) // 궁극기 공격!

// 궁극기 공격 전략으로 변경
champion.attack(.spell) // 소환사 주문 공격!
