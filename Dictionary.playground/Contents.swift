// Тип коллекции. [Ключ]:[Значение]. Работает быстрее чем массив. Неупорядоченные значения
// Чтобы можно было редактировать делаем через (var)
// Когда из словаря возвращаем какое-либо значение мы получаем optional

var dict = ["Машина" : "car", "Мужчина" : "man"] //Str:Str
dict["Машина"]

var dict1 = ["Машина" : 12, "Мужчина" : 10] //Str:Int
dict1["Машина"]

dict.count   // Возвращает колличество пар значений
dict.isEmpty // Проверка на пустоту

dict["Компьютер"] = "mac" // Добавляем пару ключ:значения в словарь

dict.keys // Через keys можно выполнять разные методы

let comp = dict["Компьютер"] // Присвоение

if let comp = dict["Компьютер"]{ // Проверка на nil
    print("\(comp)")
} else {
    print("no value for key comp")
}

dict["Машина"] = nil // Удаление
// либо
dict.removeValue(forKey: "Мужчина") // Удаляет и возвращает значение

dict = [:] // Удаление всего словаря

// Выводим все ключи и значения. Нужно быть внимательным из-за optional, если будет nil все упадет
for key in dict.keys {
    print("key = \(key), value = \(dict[key]!)")
}

// Тоже самое только с tuples и без optional
for (key, value) in dict {
    print("key = \(key), value = \(value)")
}
