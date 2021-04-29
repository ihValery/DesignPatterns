/*
Шаги реализации
1. Изучите алгоритм и подумайте, можно ли его разбить на шаги. Прикиньте, какие шаги будут стандартными для всех вариаций алгоритма, а какие — изменяющимися.
2. Создайте абстрактный базовый класс. Определите в нём шаблонный метод. Этот метод должен состоять из вызовов шагов алгоритма. Имеет смысл сделать шаблонный метод финальным, чтобы подклассы не могли переопределить его (если ваш язык программирования это позволяет).
3. Добавьте в абстрактный класс методы для каждого из шагов алгоритма. Вы можете сделать эти методы абстрактными или добавить какую-то реализацию по умолчанию. В первом случае все подклассы должны будут реализовать эти методы, а во втором — только если реализация шага в подклассе отличается от стандартной версии.
4. Подумайте о введении в алгоритм хуков. Чаще всего, хуки располагают между основными шагами алгоритма, а также до и после всех шагов.
5. Создайте конкретные классы, унаследовав их от абстрактного класса. Реализуйте в них все недостающие шаги и хуки.
 */

class DriveVehicle {
    
    //2
    ///Сели и поехали. Весь алгорит внутри.
    final func start() {
        haveASeat()
        useProtection()
        lokkAtMirror()
        turnSignal()
        driveForward()
    }
   
    //1
    func haveASeat() {
        preconditionFailure("Этот метод должен быть переопределен")
    }
    
    func useProtection() {
        preconditionFailure("Этот метод должен быть переопределен")
    }
    
    func lokkAtMirror() {
        preconditionFailure("Этот метод должен быть переопределен")
    }
    
    func turnSignal() {
        preconditionFailure("Этот метод должен быть переопределен")
    }
    
    func driveForward() {
        preconditionFailure("Этот метод должен быть переопределен")
    }
}

class Bicycle: DriveVehicle {
    override func haveASeat() {
        print("Сядь на велосипед")
    }
    
    override func useProtection() {
        print("Надень шлем!")
    }
    
    override func lokkAtMirror() {
        print("Посмотри по сторонам (оцени обстановку)")
    }
    
    override func turnSignal() {
        print("Выстави руку (подай сигнал)")
    }
    
    override func driveForward() {
        print("Поехали!")
    }
}

class Car: DriveVehicle {
    override func haveASeat() {
        print("Сядь в машину")
         closeDoor()
    }
    
    //Метод только для автомобиля, маленькая хитрость смотри предыдущий метод
    func closeDoor() {
        print("Закрой дверь, а не хочу )))")
    }
    
    override func useProtection() {
        print("Пристегни ремень безопастности!")
    }
    
    override func lokkAtMirror() {
        print("Посмотри в правое зеркало (оцени обстановку)")
    }
    
    override func turnSignal() {
        print("Включи поворотник")
    }
    
    override func driveForward() {
        print("Поехали!")
    }
}

let car = Car()
let bicycle = Bicycle()
car.start()
bicycle.start()
