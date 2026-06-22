//
//  factoryMethod.swift
//  Algorithm
//
//  Created by 김동현 on 6/22/26.
//

import Foundation

/// Product
/// 생성될 객체가 따라야 하는 규격
protocol Animal {
    var name: String { get set }
    func sound()
}

/// Concrete Product
/// Animal 프로토콜을 실제로 구현한 구체적인 제품
class Dog: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sound() {
        print("\(name) Bark!")
    }
}

/// Concrete Product
/// Animal 프로토콜을 실제로 구현한 또 다른 구체적인 제품
class Cat: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sound() {
        print("\(name) Meow!")
    }
}

/// Creator
/// 어떤 Animal을 만들지 책임지는 생성자 역할의 인터페이스
protocol AnimalFactory {
    func make(name: String) -> Animal
}

/// Concrete Creator
/// 랜덤하게 Dog 또는 Cat을 만드는 구체적인 생성자
class RandomAnimalFactory: AnimalFactory {
    func make(name: String) -> Animal {
        return Int.random(in: 0...1) == 0 ? Dog(name: name) : Cat(name: name)
    }
}

/// Concrete Creator
/// 이전 상태를 보고 Dog와 Cat을 번갈아 만드는 구체적인 생성자
class EvenAnimalFactory: AnimalFactory {
    var previousState: Animal.Type?
    func make(name: String) -> Animal {
        if previousState == Cat.self {
            self.previousState = Dog.self
            return Dog(name: name)
        } else {
            self.previousState = Cat.self
            return Cat(name: name)
        }
    }
}

/// Client
/// AnimalFactory를 사용해서 Animal 객체들을 관리하는 클래스
/// 어떤 Animal이 생성되는지는 직접 알지 않고, factory에게 위임한다.
class AnimalCafe {
    private var animals: [Animal] = []
    private var factory: AnimalFactory
    
    init(factory: AnimalFactory) {
        self.factory = factory
    }
    
    /// factory를 통해 Animal을 생성한다.
    /// Dog인지 Cat인지는 Client가 직접 결정하지 않는다.
    func addAnimal(name: String) {
        let newAnimal = self.factory.make(name: name)
        self.animals.append(newAnimal)
    }
    
    /// 생성된 Animal들의 소리를 출력한다.
    func printAnimals() {
        self.animals.forEach { animal in
            animal.sound()
        }
    }
    
    /// 사용하는 Factory를 교체한다.
    /// 즉, 생성 방식 자체를 런타임에 바꿀 수 있다.
    func change(factory: AnimalFactory) {
        self.factory = factory
    }
    
    /// 저장된 Animal 목록을 비운다.
    func clear() {
        self.animals = []
    }
}

func main() {
    /// Concrete Creator인 EvenAnimalFactory를 Client에 주입한다.
    /// 이 Factory는 Cat과 Dog를 번갈아 생성한다.
    let animalCafe = AnimalCafe(factory: EvenAnimalFactory())

    animalCafe.addAnimal(name: "A")
    animalCafe.addAnimal(name: "B")
    animalCafe.addAnimal(name: "C")
    animalCafe.printAnimals()
    animalCafe.clear()
    print()

    /// Concrete Creator인 RandomAnimalFactory로 교체한다.
    /// 이후부터는 Animal 생성 방식이 랜덤으로 바뀐다.
    animalCafe.change(factory: RandomAnimalFactory())
    animalCafe.addAnimal(name: "A")
    animalCafe.addAnimal(name: "B")
    animalCafe.addAnimal(name: "C")
    animalCafe.printAnimals()
}

main()
