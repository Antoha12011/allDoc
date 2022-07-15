/*
 // метод = функция
 // экземпляр = переменная или константа
 // кастинг(приведение) типа делается через as! или as?
*/

// 1 принцип - Наследование. Классы могут пораждать своих наследников и в свою очередь могут быть наследниками других классов. Методы которые объявляются у класса наследника НЕ будут в родительском классе. Чтобы нельзя было наследоваться от конкретного класса нужно добавить final перед class

// 2 принцип - Инкапсуляция (заключение свойств в "капсулу"). Принцип размещения данных и методово работы с этими данными в одном объекте ну и соответственно разграничение доступа по средствам специальных слов(Флагов)

// 3 принцип - Полиморфизм это способность классов - наследников переопределять методы классов - родителя (методы(МОЖЕМ ПЕРЕОПРЕДЕЛЯТЬ ВСЕ), свойства(ТОЛЬКО ВЫЧИСЛЯЕМЫЕ СВОЙСТВА), инициализаторы(МОЖЕМ ПЕРЕОПРЕДЕЛЯТЬ ВСЕ)). Если НЕТ наследования то и НЕТ полиморфизма. Тип данных переопределяемых свойств должен всегда оставаться один и тот же, если в одном место он string в другом оставляем его же. У методов (func) есть понятие перегрузка это значит что мы добавляем в метод доп. параметры -> func teach() превращаем в func teach(hours: Int)


                                                                /// Наследование

import UIKit
import Darwin

class Gadget {
    
    let brend: String
    let model: String
    var price: Int
    let color: String
    
    var isOn = false
    
    init(brend: String, model: String, price: Int, color: String) {
        self.brend = brend
        self.model = model
        self.price = price
        self.color = color
    }
    
    
    func onOff() {
        
        isOn.toggle() // toggle работает как переключатель true -> false и может наоборот
        if isOn {
            print("\(self.brend) \(self.model) is ON")
        } else {
            print("\(self.brend) \(self.model) is OFF")
        }
    }
}

let gadget = Gadget(brend: "iPhone", model: "13", price: 1000, color: "Зеленый")

gadget.onOff() // Включается с помощью toggle
gadget.onOff() // Выключается с помощью toggle

class Phone: Gadget {
    
    let imei: String
    private var number: Int?
    
    init(brend: String, model: String, price: Int, color: String, imei: String) {
        self.imei = imei // В первую очередь инициализируется родной объект а далее родительский
        super.init(brend: brend, model: model, price: price, color: color) // через super обращаемся к инициализатору родительскому(супер) классу
    }
    
    func call(abonent: Int){
        
        guard let _ = number else {
            print("сим-карта не вставлена")
            return
        }
        print("Выполняю звонок по номеру \(abonent)")
        
    }
    
    func insertSIM(number: Int){
        self.number = number
    }
    
    func getNumber() -> Int? {
        guard let number = number else {
            return nil
        }
        return number
    }
    
    private func download(title: String){
        print("Фильм \(title) был загружен!")
    }
    
}

let iPhone = Phone(brend: "iPhone", model: "12", price: 1000, color: "White", imei: "KFGTKFIR39545")

                                                                    /// Полиморфизм

class Teacher {
    
    let name: String
    var discription: String {
        return "Привет меня зовут \(name). Я учитель"
    }
    init(name: String) {
        self.name = name
    }
    func teach() {
        print("Я учу людей прямо сейчас!")
    }
}

class IosTeacher: Teacher {
    
    let speciality: String
    
    override var discription: String { // Переопределение идет через override
        return "Привет меня зовут \(name), я учитель по IOS разработке моя специальность - \(speciality)"
    }
    
    init(name: String, speciality: String){
        self.speciality = speciality
        super.init(name: name)
    }
    override init(name: String) { // Переопределение идет через override
        self.speciality = "Фронт"
        super.init(name: name)
    }
    override func teach() {
        print("Я учу людей Ios разработке")
    }
    
    
    func swiftCoding() {
        print("Я программирую на Swift")
    }
}



let teacher = Teacher(name: "Антон")
teacher.name
teacher.discription
teacher.teach()

let iosTeacher = IosTeacher(name: "Петр", speciality: "Фронт")
iosTeacher.speciality
iosTeacher.name
iosTeacher.teach()
iosTeacher.swiftCoding()
iosTeacher.discription // Имя свойства осталось таким же но реализуется уже по другому из-за override

let iosDev = IosTeacher(name: "Андрей")
iosDev.speciality
iosDev.discription
iosDev.teach()
    
                                                                /// Инкапсуляция

class Wallet {
    
    static let shared = Wallet() // SingleTone - паттерн класса гарантирует нам что у данного класса будет создать 1 экземпляр
    
    private var balance = 0
    
    private init() { }  // Такой инициализатор говорит нам что мы можем пользовать им только внутри класса wallet
    
    func add(cash: Int){
        self.balance += cash
        print(self.balance)
    }
    
    func withDraw(cash: Int) -> Int{
        
        guard cash <= balance else {
            return 0
            
        }
        balance -= cash
        return cash
    }
    func getBalance() -> Int {
        return self.balance
    }
}



class Shop{
    
    var wallet = Wallet.shared
    
}


class Job{
   
    var wallet = Wallet.shared
    
}

var magnit = Shop()
var fabrica = Job()

fabrica.wallet.add(cash: 15_000)
let checkSum = magnit.wallet.withDraw(cash: 3_000)

print(checkSum)



