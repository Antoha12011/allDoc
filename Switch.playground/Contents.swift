// Инструкция switch
// Работа с последовательностью. Код идет сверху вниз

var age = 67

if age == 21{
    print("hi")
}else if age == 22{
    print("by")
}
    
switch age {
    case 0...16: print ("kid"); fallthrough // Закидывает в следующий кейс не проверяя его условия
    case 17...30: print ("young")
    case 31...50: break // Если мы используем break после young мы выйдем из цикла switch и код пойдет дальше. Break используется либо когда нужно выйти либо когда пустая строка

    default: break
}

// Кейсы с одинаковыми условиями можно объединять так: case 54, 55, 56, 57: print...

// Объединение нескольких switch, мы проверяем name и age

var name = "Alex"

switch name {
    case "Alex" where age < 50:
print("hi")
    case "Alex" where age >= 50:
print("by")
    default: break
}


// Switch и tuples

let tuple = (name, age)

switch tuple{
    case ("Alex", 60): print("hi Alex 60")
    case (_, let number) where number >= 65 && number <= 70: print("hi old man") // В данном случае мы игнорируем имя(_), но захватываем возраст. Let number привязывается к age(1 индекс)
    case ("Alex", _): print("hi Alex")
        
    default: break
}

let array: [CustomStringConvertible] = [5, 5.4, Float(5.4)] // Custom... приводит все типы к дефолту. В данном примере узнаем тип нашей переменной

switch array[2]{
    case _ as Int: print("Int")
    case _ as Float: print("Float")
    case _ as Double: print("Double")
        
    default: break
}

