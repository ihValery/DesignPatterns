/*
Шаги реализации

1. Создайте таблицу соотношений типов продуктов к вариациям семейств продуктов.
2. Сведите все вариации продуктов к общим интерфейсам.
3. Определите интерфейс абстрактной фабрики. Он должен иметь фабричные методы для создания каждого из типов продуктов.
4. Создайте классы конкретных фабрик, реализовав интерфейс абстрактной фабрики. Этих классов должно быть столько же, сколько и вариаций семейств продуктов.
5. Измените код инициализации программы так, чтобы она создавала определённую фабрику и передавала её в клиентский код.
6. Замените в клиентском коде участки создания продуктов через конструктор вызовами соответствующих методов фабрики.
 */

protocol Chair {
    func description()
}

//2
class NMChair: Chair {
    func description() {
        print("Кресло из благородной древесины ручной работы")
    }
}

class LTChair: Chair {
    func description() {
        print("Кресло разработанное на основе последних технологий")
    }
}

protocol Sofa {
    func description()
}

class NMSofa: Sofa {
    func description() {
        print("Диван из древесины обшитый изысканными материалами")
    }
}

class LTSofa: Sofa {
    func description() {
        print("Диван спроектированный на основе новейших технологий")
    }
}

protocol CoffeeTable {
    func description()
}

class NMCoffeeTable: CoffeeTable {
    func description() {
        print("Кофейный столик эксклюзивного дизайна ручной работы")
    }
}

class LTCoffeeTable: CoffeeTable {
    func description() {
        print("Кофейный столик разработанный искуственным интелектом")
    }
}

//3
protocol Workshop {
    func manufactureChair() -> Chair
    func manufactureSofa() -> Sofa
    func manufactureCoffeeTable() -> CoffeeTable
}

//4
class NaturalMaterials: Workshop {
    func manufactureChair() -> Chair {
        print("Кресло по индивидуальному заказу изготовлено")
        return NMChair()
    }
    
    func manufactureSofa() -> Sofa {
        print("Диван по индивидуальному заказу изготовлено")
        return NMSofa()
    }
    
    func manufactureCoffeeTable() -> CoffeeTable {
        print("Кофейный столик по индивидуальному заказу изготовлено")
        return NMCoffeeTable()
    }
}

class LastTechnology: Workshop {
    func manufactureChair() -> Chair {
        print("Кресло по индивидуальному заказу изготовлено")
        return LTChair()
    }
    
    func manufactureSofa() -> Sofa {
        print("Диван по индивидуальному заказу изготовлено")
        return LTSofa()
    }
    
    func manufactureCoffeeTable() -> CoffeeTable {
        print("Кофейный столик по индивидуальному заказу изготовлено")
        return LTCoffeeTable()
    }
}

let woodenChair = NaturalMaterials().manufactureChair()
woodenChair.description()

let artSofa = LastTechnology().manufactureSofa()
artSofa.description()

let coffeTable = LastTechnology().manufactureCoffeeTable()
coffeTable.description()
