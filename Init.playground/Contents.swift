/*
 
                                                                Init - инициализация
 
*/


import UIKit

class Car {
    
    let brendAndModel: String
    let wheelsCount: Int
    var color = "White"
    
// Инициализатор по умолчанию (дэфолтная)(по умолчанию создаем параметры, в данном случае wheelsCount = 4

    init (brendAndModel: String, wheelsCount: Int = 4) {
        self.brendAndModel = brendAndModel
        self.wheelsCount = wheelsCount
    }
    
// Memberwise - инициализатор (Полностью дублирует свои свойства)
    
    init (brendAndModel: String, wheelsCount: Int, color: String) {
        self.brendAndModel = brendAndModel
        self.wheelsCount = wheelsCount
        self.color = color
    }
    
// Failable - инициализатор(после init ставится (?)) То есть объект либо будет проинициализирован либо будет nil
    
        init?(brend: String, model: String, wheelsCount: Int) {
          
            if wheelsCount < 4 {
                return nil
            } else {
                self.wheelsCount = wheelsCount
                self.brendAndModel = "\(brend) \(model)"
            }
        }
        
// "Удобный" инициализатор
      
        convenience init(brendAndModel: String, color: String){
            self.init(brendAndModel: brendAndModel)
            self.color = color
        }
    
let mercedes = Car(brendAndModel: "Audi A7") // По умолчанию данный инициализатор имеет уже 4 колеса, осталось задать только модель авто
let Bmw = Car(brendAndModel: "Bmw M4", wheelsCount: 4) // В данном случае мы указываем полный инициализатрор
let Honda = Car(brendAndModel: "Accord", color: "Red") // Тоже с 4 колесами
}
