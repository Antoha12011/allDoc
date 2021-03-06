// Массив - упорядоченная коллекция элементов одного и того же типа.

// Пустой массив строк

var names:[String] = []
var name = [String]()

// Массив со значениями

var nam = ["Nikolay", "Peter", "David"]

// Массив с повторяющимися элементами

var wallet = [Int](repeating: 50, count: 5) // 50 повторяется 5 раз
print(wallet)

// Часто для прохода по массивам используется цикл for-in

for name in names{ // После in указываем по какому массиву мы будем проходить, в print указываем, что хотим вывести
    print(name)
}

// Пройти по массиву можно по индексу. В данном случае выведет 0,1,2 чтобы вывести элементы("Имена") массива пишем print(names[index])

for index in names.indices{
    print(index)
}

// С помощью свойства count можно посчитать массив

print(names.count) // = 3

// Проверка на пустоту массива

if names.isEmpty{
    print("Пустой")
}else{ // Если не пустой показываем print
    print("Не пустой")
}

// Добавить новый элемент в массив

wallet.append(100) // Этот метод добавляет в конец массива

// Можно сложить несколько массивов

let wallet2 = [500,1000] // Имеющийся массив
wallet += wallet2
// Либо
wallet += [500,1000]

// Чтобы добавить элемент в начало массива

wallet.insert(5000, at: 0) // 5000 добавляем по 0 индексу

// Удаление элемента по индексу

wallet.remove(at: 0)

// Замена сразу нескольких элементов массива

wallet[0...2] = [10,10,10]

// Сортировка массива по возрастанию

wallet.sort()

// Сортировка по убыванию

wallet.sort(by: >)

// Sorted возращает копию массива
// Фильтруем массив

let filterArray = wallet.filter {(item) -> Bool in // item - название каждого элемента в массиве
    item == 10 // Достаем только 10 из массива
}
print(filterArray)

// Чтобы каждое число возвести в квадрат используем map

let mapArrat = wallet.map {$0 * $0}
print(mapArrat)

// Определяем есть ли нужный элемент в массиве

if mapArrat.contains(40000){
    print("Да") // Если есть выводим да, если нет соответственно выводим нет
}else{
    print("Нет")
}
