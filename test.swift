protocol Printer {
    /// 특정 Printer가 처리하는 타입
    associatedtype Value
    func printValue(_ value: Value)
}

/// 내부에서 실제 Printer를 대신 실행해주는 공통 인터페이스
protocol PrinterBox {
    func printValue(_ value: Any)
}

/// 실제 구체 타입 Printer를 감싸는 Box
struct AnyPrinterBox<Base: Printer>: PrinterBox { 
    /// Base: 실제 감싸고 있는 구체 타입
    /// ex) AnyPrinterBox<IntPrinter>
    /// ex) AnyPrinterBox<IntPrinter>
    let base: Base

    func printValue(_ value: Any) {
        if let value = value as? Base.Value {
            base.printValue(value)
        }
    }
}

/// 외부에서 사용하는 타입 소거 Wrapper
struct AnyPrinter: Printer {
    private let box: any PrinterBox

    // 제네릭을 직접 드러내서 쓴 형태로 가장 전통적, 명확함
    // init<P: Printer>(_ printer: P) {
    //     self.box = AnyPrinterBox(base: printer)
    // }

    // 문법은 더 간단해보임, 하지만 개념적으로 여전히 호출마다 하나의 구체 타입을 받는 제네릭적 동작.
    // 여기서는 some이 아무 Printer 하나가 아니라 호출 시 결정되는 구체적인 Printer 타입 하나이다.
    init(_ base: some Printer) {
        self.box = AnyPrinterBox(base: base)
    }

    // -> some Printer는 any Printer처럼 “아무 Printer 박스”가 아니라, 호출 시점에 결정되는 구체 타입 하나를 받는 제네릭처럼 동작하기 때문에 AnyPrinterBox(base:)에 그대로 넘길 수 있다
    func printValue(_ value: Any) {
        box.printValue(value)
    }
}

struct IntPrinter: Printer {
    func printValue(_ value: Int) {
        print("Int: \(value)")
    }
}

struct StringPrinter: Printer {
    func printValue(_ value: String) {
        print("String: \(value)")
    }
}

let printers: [AnyPrinter] = [
    AnyPrinter(IntPrinter()),
    AnyPrinter(StringPrinter())
]

for printer in printers {
    printer.printValue(10)
    printer.printValue("10")
}