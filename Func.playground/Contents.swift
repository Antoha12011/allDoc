// Функции используются чтобы не дублировать код по несколько раз.
// Название нужно давать правильно(что делает то и пишем)
// Знак () - функция ничего не принимает и не возвращает
//

func calculate(){                                  // Пример обычной функции, ничего не возвращает и не принимает.
}


func calculateMoney(copy: [Int]){                // Функция которая считает деньги в wallet
    
    var sum = 0

    for value in wallet {
        sum += value
    }
    print("sum = \(sum)")
}

var wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]
calculateMoney(copy: wallet)    // Вызываем функцию которая считает и выдает 288

// Объявление и вызов функции

func greetings(){
    
}
greetings()

// Приём параметов функции () внутри этих скобок

func square(number: Int){
    print(number * number)
}
square(number: 100)

// Возвращать // Return можно не писать если всего 1 возвращаемое выражение в теле функции как в данном случае

func kit(number: Int) -> Int{
    return number * number
}

var result = kit(number: 8)
print(result)



//Возвращать два или более значений из функции

func botton() -> [String]{
    ["Антон", "Павлов"]
}

let user = botton()
print(user[0])

// Вариант снизу более лучше ибо есть разделение на фамилию и имя

func gerUser() -> [String:String]{
    ["FirstName":"Anton", "LastName":"Pavlov"]
}

let user1 = gerUser()
print(user1["FirstName"]) // Ошибка из-за отсутствия (!)

                                                                                        // (пример через tuple) - самый удобный в этом примере

func getUser2() -> (first: String, second: String){
    (first: "Anton", second: "Pavlov")
}

let user2 = getUser2()
print(user2.first)


// В функиях можно делать двойные имена для удобства понимания

func sayHello(to name: String){
    print("Hello, \(name)!")
}
sayHello(to: "Anton") // осталось только to

// Пропуск имен параметров с помощью (_). Но все же рекомендуется использовать имена чтобы не путаться

func greet(_ person: String){
    print("Hello, \(person)!")
}

greet("Anton")
 
// Вариативные функции и вариативные параметры через (Int...)

func calculate(numbers: Int...){
    for number in numbers {
        print("\(number) calculate is \(number * number)")
    }
}
calculate(numbers: 1, 2, 3, 4, 5)

// Сквозные параметры (inout)

func doubleIt(number: inout Int){
    number *= 2
}

var myNumber = 10
doubleIt(number: &myNumber)
