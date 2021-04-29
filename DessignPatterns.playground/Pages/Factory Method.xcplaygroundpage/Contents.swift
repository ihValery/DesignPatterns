/*
 Шаги реализации

1. Приведите все создаваемые продукты к общему интерфейсу.
2. В классе, который производит продукты, создайте пустой фабричный метод. В качестве возвращаемого типа укажите общий интерфейс продукта.
3. Затем пройдитесь по коду класса и найдите все участки, создающие продукты. Поочерёдно замените эти участки вызовами фабричного метода, перенося в него код создания различных продуктов.
    В фабричный метод, возможно, придётся добавить несколько параметров, контролирующих,
    какой из продуктов нужно создать.
    На этом этапе фабричный метод, скорее всего, будет выглядеть удручающе. В нём будет жить
    большой условный оператор, выбирающий класс создаваемого продукта. Но не волнуйтесь, мы
    вот-вот исправим это.
4. Для каждого типа продуктов заведите подкласс и переопределите в нём фабричный метод. Переместите туда код создания соответствующего продукта из суперкласса.
5. Если создаваемых продуктов слишком много для существующих подклассов создателя, вы можете подумать о введении параметров в фабричный метод, которые позволят возвращать различные продукты в пределах одного подкласса.
    Например, у вас есть класс Почта с подклассами АвиаПочта и НаземнаяПочта, а также классы
    продуктов Самолёт, Грузовик и Поезд. Авиа соответствует Самолётам, но для НаземнойПочты есть
    сразу два продукта. Вы могли бы создать новый подкласс почты для поездов, но проблему можно
    решить и по-другому. Клиентский код может передавать в фабричный метод НаземнойПочты
    аргумент, контролирующий тип создаваемого продукта.
6. Если после всех перемещений фабричный метод стал пустым, можете сделать его абстрактным. Если в нём что-то осталось — не беда, это будет его реализацией по умолчанию.
 */


protocol Transport {
    func deliver()
}

//1
class Truck: Transport {
    func deliver() {
        print("Товар будет доставлен грузовиком \(String(describing: RoadLogistics.self))")
    }
}

class Ship: Transport {
    func deliver() {
        print("Товар будет доставлен судном \(String(describing: SeaLogistics.self))")

    }
}

class Airplane: Transport {
    func deliver() {
        print("Товар будет доставлен самолетом \(String(describing: SkyLogistics.self))")
    }
}

//2 LogisticsFactory
protocol Logistics {
    func createTransport() -> Transport
}

//4
class RoadLogistics: Logistics {
    func createTransport() -> Transport {
        print("\(String(describing: RoadLogistics.self)) сделал запрос на создание нового транспорта: Грузовик")
        return Truck()
    }
}

class SeaLogistics: Logistics {
    func createTransport() -> Transport {
        print("\(String(describing: SeaLogistics.self)) сделал запрос на создание нового транспорта: Судно")
        return Ship()
    }
}

class SkyLogistics: Logistics {
    func createTransport() -> Transport {
        print("\(String(describing: SkyLogistics.self)) сделал запрос на создание нового транспорта: Самолет")
        return Airplane()
    }
}

var seaLogistics = SeaLogistics()
let ship = seaLogistics.createTransport()
ship.deliver()

var truck = RoadLogistics()
truck.createTransport().deliver()

var airplane = SkyLogistics().createTransport()
airplane.deliver()
