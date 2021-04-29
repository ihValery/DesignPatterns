/*
Шаги реализации

1. Убедитесь, что у вас есть два класса с неудобными интерфейсами:
 - полезный сервис — служебный класс, который вы не можете изменять (он либо сторонний, либо от него зависит другой код);
 - один или несколько клиентов — классов приложения, несовместимых с сервисом из-за неудобного или несовпадающего интерфейса.
2. Опишите клиентский интерфейс, через который классы приложения смогли бы использовать сторонний класс.
3. Создайте класс адаптера, реализовав этот интерфейс.
4. Поместите в адаптер поле-ссылку на объект-сервис. В большинстве случаев, это поле заполняется объектом, переданным в конструктор адаптера. В случае простой адаптации этот объект можно передавать через параметры методов адаптера.
5. Реализуйте все методы клиентского интерфейса в адаптере. Адаптер должен делегировать основную работу сервису.
6. Приложение должно использовать адаптер только через клиентский интерфейс. Это позволит легко изменять и добавлять адаптеры в будущем.
 */

//adapree - адаптируем
class SimpleCat {
    func sound() -> String {
        "Мяу мяу мяу"
    }
}

//target
protocol AnimalProtocol {
    func makeSound() -> String
}

//класс под который подстраивамся
class SuperCat: AnimalProtocol {
    func makeSound() -> String {
        "Грррррррр"
    }
}

//3
class Adapter: AnimalProtocol {
    var simpleCat: SimpleCat
    
    //4
    init(simpleCat: SimpleCat) {
        self.simpleCat = simpleCat
    }
    
    func makeSound() -> String {
        simpleCat.sound()
    }
    
}

var cat = SimpleCat()
cat.sound()
var superCat = SuperCat()
superCat.makeSound()

var catAdapter = Adapter(simpleCat: cat)
catAdapter.makeSound()
cat.sound()

class SuperAnimal {
    
    let superCat: AnimalProtocol
    
    init(superCat: AnimalProtocol) {
        self.superCat = superCat
    }
}

var superOne = SuperAnimal(superCat: catAdapter)
superOne.superCat.makeSound()

var superTwo = SuperAnimal(superCat: superCat)
superTwo.superCat.makeSound()
