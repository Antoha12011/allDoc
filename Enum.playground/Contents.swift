/*
                        Enum - перечисление, это значение, которое копируется (value type). Когда мы называем enum мы объявляем новый тип данных.
                        Фиксированный список чего-нибудь в программе
 
*/
import UIKit

enum Action {
    case Walk(meters: Int) // Ассоциативное значение meters, значений может быть сколько угодно и сколько угодно типов
    case Run(meters: Int, speed: Int)
    case Stop
    case Turn
}

var action = Action.Run(meters: 20, speed: 15) // Тип Action, значение Run, можно создавать без значений

// Можно обращаться 2-я способами:
action = .Walk(meters: 10)
action = Action.Walk(meters: 10)

/// --------------------------------------------------------------------------------------------------------------------------------------------------------------

enum TypeDevice {
    case laptop
    case desktopComputer
    case tablet
    case smartPhone
    case smartWatch
}

let device: TypeDevice = .laptop

switch device {
case.laptop:
    print("Ноутбук")
case.desktopComputer:
    print("Компьютер")
case.tablet:
    print("Планшет")
case.smartPhone:
    print("Телефон")
case.smartWatch:
    print("Часы")
}

