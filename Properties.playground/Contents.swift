/*
                                            Свойства(var / let) - это значения связанные с классом или его экземпляром.
                    1) Если свойство связано с экземпляром класса, то они называются свойствами экземпляра класса.
                    2) А если с самим классом, то свойствами типа
 
                                                        СВОЙСТВА ЭКЗЕМПЛЯРА делятся на 2 типа:
                                        1) Сохраняемые свойства (stored properties)
                                        2) Вычисляемые свойства (computed properties)
 
*/

                                                                /// 1
import UIKit

struct Observer { // Observer - наблюдатель. Если происходят изменения сработываеи Observer. Он следит за Properties
    
    var name: String { // Свойство с именем name
        
        willSet{ // Значения собираются перейти в контейнер. Работает только с newValue
            print("Значение хочет измениться на" + " " + newValue)
        }
        didSet{ // Значения уже перешли в контейнер. Работает только с oldValue
            print("didSet" + " = " + oldValue)
            if name != "" {
                name = name.capitalized // capitalized - Метод делает первую букву заглавной а остальные маленькие
            }
        }
    }
}
///---------------------------------------------------------------------------------------------------------------------------------------------------------
var obser = Observer(name: "Jack")
obser.name // getter - Вызывается просто чтобы прочитать
obser.name = "Anton" // Setter -  Назначаем этой переменной новое свойство
///---------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                /// 2
/// Выполнение с использованием функций

struct Worker {
    var name: String
    var monthlySalary: Double
    var weeksPerMonth: Int
    var hoursPerDay: Double
}

var worker1 = Worker(name: "Антон", monthlySalary: 30_000, weeksPerMonth: 4, hoursPerDay: 8)

func weeklySalary(monthlySalary: Double, weeksPerMonth: Int) -> Double {
    return monthlySalary / Double(weeksPerMonth)
}
func hourlySalary(monthlySalary: Double, weeksPerMonth: Int, hoursPerDay: Double) -> Double {
    return monthlySalary / Double(weeksPerMonth) / (hoursPerDay * 5)
}
worker1.monthlySalary
weeklySalary(monthlySalary: worker1.monthlySalary, weeksPerMonth: worker1.weeksPerMonth)
hourlySalary(monthlySalary: worker1.monthlySalary, weeksPerMonth: worker1.weeksPerMonth, hoursPerDay: worker1.hoursPerDay)

// Все это можно решить проще через computed properties.

/// Выполнение с использованием get

struct Worker2 {
    var name: String
    var monthlySalary: Double
    var weeksPerMonth: Int
    var hoursPerDay: Double
    
    var weeklySalary: Double {
        return monthlySalary / Double(weeksPerMonth)
    }
    var hourlySalary: Double {
        return monthlySalary / Double(weeksPerMonth) / (hoursPerDay * 5)
    }
}

var worker2 = Worker2(name: "Bob", monthlySalary: 25_000, weeksPerMonth: 4, hoursPerDay: 9)

worker2.weeklySalary
worker2.hourlySalary

/// Выполнение с использованием get и set

struct Worker3 {
    var name: String
    var monthlySalary: Double
    var weeksPerMonth: Int
    var hoursPerDay: Double
    
    var weeklySalary: Double {
        get {
            return monthlySalary / Double(weeksPerMonth)
        }
    }
    
    var hourlySalary: Double {
        get {
            return monthlySalary / Double(weeksPerMonth) / (hoursPerDay * 5)
        }
        set { // Если не устраивает название newValue после set в скобках пишим свое
            monthlySalary = newValue * hoursPerDay * 5 * Double(weeksPerMonth)
        }
    }
}

var worker3 = Worker3(name: "Антон", monthlySalary: 50_000, weeksPerMonth: 4, hoursPerDay: 8)
worker3.monthlySalary
worker3.weeklySalary
worker3.hourlySalary = 80 // При изменение не будет ошибки потому что используется set

///_________________________________________________________________________________________________________________________________________________________

class SalesManager {
    // Хранимые свойство. Ничем не отличаются от констант и переменных с которыми я уже работал ранее
    var salaryBase = 15_000
    var calls = 0
    var salesAmount = 0
    var sanctionsAmount = 0
    
    // СВОЙСТВА ТИПА - Относятся только к классу. Добавление значения для всего класса
    // Хранимые (статические) - не могут наследоваться
    static var phoneModel = "iPhone 11"
    
   
    
    // Вычисляемое свойство - вычисляется на основе хранимых свойств. Вычисляемые свойства не могут быть константой тк они могут и должны меняться
    var motivation: Int{
        
        if calls >= 130 && salesAmount >= 300_000 {
            
            let motiv = self.calls * 50 + (salesAmount * 12 / 100)
            
            return motiv
        } else {
            return 0
        }
    }
    // Второе вычисляемое свойство
    var salary: Int {
        
        var result = salaryBase + motivation - sanctionsAmount
        
        guard result >= salaryBase / 2 else {
            result = salaryBase / 2
            return result
        }
        
        return result
    }
    
    
}

// У класса могут быть СВОЙСТВА ТИПА.
SalesManager.phoneModel


// Классовые (вычисляемые свойства) - могут наследоваться
//class var companyTitle: String { return "Антон" }


// Линивые свойства - Инициализируются только тогда когда мы впервые к ним обращаемся
//lazy var

// Наблюдатель
//willSet - Работает перед установкой нового значения
//didSet  - Работает после установки нового значения
