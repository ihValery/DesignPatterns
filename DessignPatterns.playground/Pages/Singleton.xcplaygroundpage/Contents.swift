/*
Шаги реализации

 1. Добавьте в класс приватное статическое поле, которое будет содержать одиночный объект.
 2. Объявите статический создающий метод, который будет использоваться для получения одиночки.
 3. Добавьте «ленивую инициализацию» (создание объекта при первом вызове метода) в создающий метод одиночки.
 4. Сделайте конструктор класса приватным.
 5. В клиентском коде замените вызовы конструктора вызовами создающего метода.
 */

class Safe {
    static let shared = Safe()
    private init() {}
    
    var money = 0
}

var left = Safe.shared
left.money = 100
print(left.money)
var leftTwo = left
left.money = 200
print(leftTwo.money)

/*
//Без private init() {} создается новый обект
let right = Safe()
print(right.money)
*/

let right = Safe.shared
print(right.money)
