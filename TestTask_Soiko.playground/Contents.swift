import UIKit

protocol RunningCreature {
    var IsAnamalRunning: Bool { get set }
    
    func running()
    func stopped()
    
    func speedOfRunning(speed: Int) -> Int
    func countOfLegs(legs: Int) -> Int
}

enum Voice {
    case low, medium, hight
}

protocol SpeakingCreature {
    var voice: Voice { get }
    var isMuted: Bool { get set }
    
    func unMuted()
    func speak()
}

class Name {
    var name: String
    var surname: String
    var patronymic: String
    
    init(name: String, surname: String, patronymic: String) {
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
    }
}

struct Human {
    var age: Int {
        get {
            return self._age
        }
        set {
            if newValue > 0 || newValue != age {
                self._age = newValue
            }
        }
    }
    
    private var name: Name
    private var _age: Int = 18
    
    static var isPersonAdult: Bool {
        return true
    }
    //    var happyBirthdayAction(newValue: { didSet { age(from: oldValue) } }
}

class Animal {
    private(set) var isHerbivorous: Bool
    private(set) var nameFromSecondTask: String
    class var numberOfInstances: Int {
        return 3456
    }
    init(isHerbivorous: Bool, nameFromSecondTask: String) {
        self.isHerbivorous = isHerbivorous
        self.nameFromSecondTask = nameFromSecondTask
    }
    class func printInfo(){
        print("""
        примерное количество животных этого типа по всему миру \(self.numberOfInstances)
        """)
    }
}

class Tiger: Animal, RunningCreature {
    var IsAnamalRunning: Bool
    
    override class var numberOfInstances: Int {
        return 8753
    }
    
    func running() {
        if IsAnamalRunning == true {
            print("Tiger have been running")
        } else {
            print("Tiger have not been running")
        }
    }
    
    func stopped() {
        if IsAnamalRunning == true {
            return
        } else {
            print("Tiger have not been stopped")
        }
    }
    
    func speedOfRunning(speed: Int) -> Int {
        print(speed)
        return speed
    }
    
    func countOfLegs(legs: Int) -> Int {
        print(legs)
        return legs
    }
    
    
    func eating(animal: String) {
        if animal is RunningCreature {
            print("скорость бега должна быть меньше скорости тигра")
        } else if animal is Tiger {
            print("Животное - тигр")
        } else {
            print(animal)
        }
    }
    
    override class func printInfo(){
        super.printInfo()
        
        print("""
        примерное количество животных этого типа по всему миру \(self.numberOfInstances)
        """)
    }
    
    init(isHerbivorous: Bool, nameFromSecondTask: String, IsAnamalRunning: Bool, numberOfInstances: Int) {
        self.IsAnamalRunning = IsAnamalRunning
        super.init(isHerbivorous: isHerbivorous, nameFromSecondTask: nameFromSecondTask)
    }
}

class Parrot: Animal, SpeakingCreature {
    var voice: Voice
    
    var isMuted: Bool
    
    override class var numberOfInstances: Int {
        return 98658
    }
    
    func unMuted() {
        isMuted.toggle()
    }
    
    func speak() {
        if isMuted == true {
            print("Попупагай умеет говорить")
        }
    }
    
    init(isHerbivorous: Bool, nameFromSecondTask: String, isMuted: Bool, numberOfInstances: Int, voice: Voice) {
        self.isMuted = true
        self.voice = .low
        super.init(isHerbivorous: isHerbivorous, nameFromSecondTask: nameFromSecondTask)
    }
}

final class Zoo {
    private(set) var maxNumberOfAnimals: Int
    private(set) var nameOfTheZoo: String
    private(set) var animals: [Animal] = []
    
    public var totalNumberOfVisitors: Int = 0 {
        willSet(newVisitors) {
            print("\(newVisitors). Мы так рады, что Вы пришли к нам под номером \(newVisitors), дорогой \(Name(name: "Петр", surname: "Иван", patronymic: "Иванович"))")
        }
    }
    init(maxNumberOfAnimals: Int, nameOfTheZoo: String, totalNumberOfVisitors: Int) {
        self.maxNumberOfAnimals = maxNumberOfAnimals
        self.nameOfTheZoo = nameOfTheZoo
        self.totalNumberOfVisitors = totalNumberOfVisitors
    }
}
