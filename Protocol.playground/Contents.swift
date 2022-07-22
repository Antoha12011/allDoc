/*
 
 Протокол - это абстрактный тип данных. Абстрактный потому что не существует явных экземпляров данного типов, могут быть только экземпляры которые могу  соответствовать данному типу = быть подписанными под этот тип. Протокол - это набор правил которые должны быть выполнены.
 
 */


protocol FullyNamed {

    var fullName: String { get } // Это свойство будет получаться (get) нашим классом / структурой и тд
}
///------------------------------------------------------------------------

struct Person: FullyNamed {
    
    var fullName: String
    var age: Int
    var phoneNumber: Int
    
}

class Company: FullyNamed {
    var fullName: String
    var director = "Тим Кук"
    
    init(prefix: String, title: String) {
        self.fullName = "\(prefix) \(title)"
    }
}

let misha = Person(fullName: "Михаил", age: 20, phoneNumber: 890939494054)
let alisa = Person(fullName: "Алиса", age: 45, phoneNumber: 89343534234)

let apple = Company(prefix: "LLC", title: "Apple")
let google = Company(prefix: "LLC", title: "Google")


class Bank: Company {
    
    var clients = [FullyNamed]()
    
}

let bank = Bank(prefix: "ООО", title: "Альфа - Банк")

bank.clients.append(misha)
bank.clients.append(alisa)
bank.clients.append(apple)
bank.clients.append(google)
google.director = "Абрамович"

for client in bank.clients {
    print(client.fullName)
    
    if client is Person {
        print((client as! Person).phoneNumber)
    } else if client is Company {
        print((client as! Company).director)
    }
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------

enum Speciality {
    case ios, android, python, java
}

protocol Human {
    var name: String { get }
}

protocol Developer {
    var speciality: Speciality { get }
    var experiance: Int { get }
}

protocol Teacher {
    var speciality: Speciality { get }
    func teach(theme: String) // Когда мы в протоколе просим реализовать функцию то мы ее там не реализуем а лишь указываем имя функции и ее функциональный тип (в протоколе мы от кого требуем реализовать эту функцию)
}

struct DevTeacher: Human, Developer, Teacher { // Композиция протоколов


    var speciality: Speciality
    var name: String
    var experiance: Int
    
    func teach(theme: String) {
        print("Учу людей. Тема урока: \(theme)")
    }
    
}
    
let anton = DevTeacher(speciality: .ios, name: "Антон", experiance: 1)

anton.speciality
anton.name
anton.teach(theme: "Программированию")



// Паттерн Делегат

// Делегатор - тот кто ставит задачу. Имеет ссылку на протокол и выбирает делегата, может попросить какого нибудь делегата выполнить какое нибудь действие
// Тип делегата - протокол который описывает какими свойстами и методами должен обладать Делегат
// Делегат - тот кто исполняет задачу. Наследует протокол и выполняет правила



