//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/22/26.
//

import Foundation

/// Abstract Product
/// 생성될 동물이 따라야 하는 규격
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

/// Abstract Product
/// 동물에게 줄 음식이 따라야 하는 규격
protocol Food {
    func eat()
}

/// Concrete Product
/// Dog와 함께 사용되는 음식
class DogFood: Food {
    func eat() {
        print("Eat dog food")
    }
}

/// Concrete Product
/// Cat과 함께 사용되는 음식
class CatFood: Food {
    func eat() {
        print("Eat cat food")
    }
}

/// Abstract Factory
/// 서로 관련 있는 제품군인 Animal과 Food를 함께 생성하는 인터페이스
protocol AnimalFactory {
    func makeAnimal(name: String) -> Animal
    func makeFood() -> Food
}

/// Concrete Factory
/// Dog 제품군을 생성한다.
/// Dog와 DogFood처럼 서로 어울리는 객체 조합을 보장한다.
class DogFactory: AnimalFactory {
    func makeAnimal(name: String) -> Animal {
        return Dog(name: name)
    }
    
    func makeFood() -> Food {
        return DogFood()
    }
}

/// Concrete Factory
/// Cat 제품군을 생성한다.
/// Cat과 CatFood처럼 서로 어울리는 객체 조합을 보장한다.
class CatFactory: AnimalFactory {
    func makeAnimal(name: String) -> Animal {
        return Cat(name: name)
    }
    
    func makeFood() -> Food {
        return CatFood()
    }
}

/// Client
/// Abstract Factory를 사용해서 Animal과 Food를 생성한다.
/// 구체 타입이 Dog인지 Cat인지는 직접 알지 않고 factory에게 위임한다.
class AnimalCafe {
    private var animals: [Animal] = []
    private var foods: [Food] = []
    private var factory: AnimalFactory
    
    init(factory: AnimalFactory) {
        self.factory = factory
    }
    
    /// factory를 통해 서로 관련 있는 Animal과 Food를 함께 생성한다.
    func addAnimalSet(name: String) {
        let animal = self.factory.makeAnimal(name: name)
        let food = self.factory.makeFood()
        
        self.animals.append(animal)
        self.foods.append(food)
    }
    
    /// 생성된 Animal과 Food를 함께 출력한다.
    func printAnimalSets() {
        for index in animals.indices {
            animals[index].sound()
            foods[index].eat()
        }
    }
    
    /// 사용하는 Factory를 교체한다.
    /// 즉, 생성되는 제품군 자체를 런타임에 바꿀 수 있다.
    func change(factory: AnimalFactory) {
        self.factory = factory
    }
    
    /// 저장된 Animal과 Food 목록을 비운다.
    func clear() {
        self.animals = []
        self.foods = []
    }
}

func main() {
    /// Concrete Factory인 DogFactory를 Client에 주입한다.
    /// 이 Factory는 Dog와 DogFood 제품군을 생성한다.
    let animalCafe = AnimalCafe(factory: DogFactory())
    
    animalCafe.addAnimalSet(name: "A")
    animalCafe.addAnimalSet(name: "B")
    animalCafe.addAnimalSet(name: "C")
    animalCafe.printAnimalSets()
    animalCafe.clear()
    print()
    
    /// Concrete Factory인 CatFactory로 교체한다.
    /// 이후부터는 Cat과 CatFood 제품군이 생성된다.
    animalCafe.change(factory: CatFactory())
    
    animalCafe.addAnimalSet(name: "A")
    animalCafe.addAnimalSet(name: "B")
    animalCafe.addAnimalSet(name: "C")
    animalCafe.printAnimalSets()
}

main()
