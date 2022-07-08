// Optional - (?) Значение может быть а может и не быть.
// nil - отсутствие данных(Int и Bool не может быть nil, только принудительно через(!))
// Прямое извлечение из-под опционала uwnroping(!). Должно использоваться только когда 100% не будет nil
 
var apple : Int? = 5 // Если убрать (?) будет крэш потому что 5 это не nil. В этом случае мы говорим что 5 может быть а может и не быть.
apple = nil

// Проверка на nil
if apple == nil {
    print("nil apple")
}else{
    print(apple!) // Принудительное развертывание (!)
}


let a = apple! + 2 // Если не поставить (!) будет ошибка ибо нельзя складывать разные типы в нашем случае optional + int


// Optional binding -

if var number = apple{
    number = number + 2
}else{
    print("nil apple")
}

// Проверка на nil(Безопастный способ)
var data: String?
data = "30.02.2019"

if data != nil{
    print("текущая дата \(data!)") // Если не пришел nil мы разворачиваем
}else{
    print("nil") // Если есть nil выводим nil
}

// Оператор опционального объединения

let name: String? = "Антон"

let defaultName = "Гость"
let correctName = name ?? defaultName // после ?? можно указывать дефолтное значение которое будет выполнятся если name = nil

// print выведет "Антон"
