// Условие - это выражение которое возвращает булевое значение
// Если значение true то мы говорим что условие выполняется
// Если значение false то условие НЕ выполняется


//1. Условие при котором человек совершеннолетний

let isAdult: Bool = 15 >= 18

//2. Проходит ли человек на аттракцион. Опираемся на рост и возраст

let currentAge = 19
let currentHeight = 170

let trueAgeRange = 14...60
let trueHeightRange = 120...200

let isGo = trueAgeRange.contains(currentAge) && trueHeightRange.contains(currentHeight) // Метод contains - true если элемент был найден в последовательности; в противном случае, false.

//3. Человек хочет купить вещь стоимость 45_000. У него на дебетовой карте есть Х рублей а на кредитке У рублей.

let creditBalance = 60_000
let debetBalance = 20_000

let buyAmount = 45_000

let isBuy = debetBalance >= buyAmount || creditBalance >= buyAmount

let isMoneyLittle = !isBuy // мало денег

                                                                // Условные операторы. IF-ELSE

//      if (условие -> Bool) {
//      Действие если условие == true
//      }else if (условие2 -> Bool){
//      Действие если условие == false, а условие2 == true
//      }else{
//      Действие если все условие == false
//      }


//1. Есть два числа необходимо напечатать большее из них

let firstNumber = 14
let secondNumber = 37

if firstNumber > secondNumber {
    print(firstNumber)  // Сначала идет условие true
}else{                  // Блок else может встречаться а может и нет
    print(secondNumber) // Потом идет условие false
}

///---------------------------------------------------------------------------------------------------------------------------------------------------------------
/// Такая же задача что и выше но уже с else if

let firstNumber1 = 14
let secondNumber1 = 14

if firstNumber1 > secondNumber1 {
    print(firstNumber1)
}else if secondNumber1 > firstNumber1{
    print(secondNumber1)
}else{
    print("Числа равны")
    print(secondNumber1)
}

//2. Есть текущий год, необходимо проверить высокостный ли год.

let currentYear = 2000

let isVisokos = currentYear % 4 == 0 && currentYear % 100 != 0 || currentYear % 400 == 0

if isVisokos {
    print("\(currentYear) - год высокосный")
} else {
    print("\(currentYear) - год не высокосный")
}
