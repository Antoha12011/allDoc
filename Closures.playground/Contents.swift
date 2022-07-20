// Closures - замыкание (без имянная функция). Их можно передавать как параметры в другие функции
// Похоже на функцию

//1. Глобальные функции
//2. Вложенные функции
//3. Замыкающее выражение


// Самое простое замыкание
let greeting = {
    print("Привет")
}

greeting()



// Замыкание с 2-я значениями: 1) Не возвращает, 2) Возвращает
//1

let message = { (user: String?, text: String) in
    if let user = user {
        print("\(user), \(text)")
    }else{
        print(text)
    }
}

message("Антон", "привет как дела?")
message(nil, "Привет")


//2

let sum = { (x: Int, y: Int) -> Int in
    let sum = x + y
    
    return sum
}
    
sum(5,67)

