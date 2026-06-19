// MARK: Target Protocol
protocol Using110V {
    func use110()
}

// MARK: - Client
class USVoltageSystem: Using110V {
    func use110() {
        print("110V 기기를 사용합니다.")
    }
}

protocol Using220V {
    func use220()
}

// MARK: - Adaptee
class KoreaVoltageSystem: Using220V {
    func use220() {
        print("220V 기기를 사용합니다.")
    }
}

class Voltage220To110Adapter: Using110V {
    
    let koreaVoltageSystem: KoreaVoltageSystem

    init(koreaVoltageSystem: KoreaVoltageSystem) {
        self.koreaVoltageSystem = koreaVoltageSystem
    }
    
    func use110() {
        koreaVoltageSystem.use220()
    }
}

let koreanMacCharger = KoreaVoltageSystem()
koreanMacCharger.use220()   // 220V 기기를 사용합니다.
// koreanMacCharger.use110()   // Error: Value of type 'KoreaVoltageSystem' has no member 'use110'

let useAdapterInUs = Voltage220To110Adapter(koreaVoltageSystem: koreanMacCharger)
useAdapterInUs.use110()     // 220V 기기를 사용합니다.