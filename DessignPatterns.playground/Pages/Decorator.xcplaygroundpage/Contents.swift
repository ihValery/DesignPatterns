/*
Шаги реализации

1. Убедитесь, что в вашей задаче есть один основной компонент и несколько опциональных дополнений или надстроек над ним.
2. Создайте интерфейс компонента, который описывал бы все общие методы как для основного компонента, так и для его дополнений.
3. Создайте класс конкретного компонента и поместите в него основную бизнес-логику.
4. Создайте базовый класс декораторов. Он должен иметь поле для хранения ссылки на вложенный объект-компонент. Все методы базового декоратора должны делегировать действие вложенному объекту.
5. И конкретный компонент, и базовый декоратор должны следовать одному и тому же интерфейсу компонента.
6. Теперь создайте классы конкретных декораторов, наследуя их от базового декоратора. Конкретный декоратор должен выполнять свою добавочную функциональность, а затем (или перед этим) вызывать эту же операцию обёрнутого объекта.
7. Клиент берёт на себя ответственность за конфигурацию и порядок обёртывания объектов.
 */

import Foundation

//2
protocol RangeRover {
    
    func getPrice() -> Double
    func getDescription() -> String
}

//3
class Sport: RangeRover {
    func getPrice() -> Double {
        69500
    }

    func getDescription() -> String {
        "Range Rover SPORT"
    }
}

class Velar: RangeRover {

    func getPrice() -> Double {
        56500
    }
    
    func getDescription() -> String {
        "Range Rover VELAR"
    }
}

class Evoque: RangeRover {
    func getPrice() -> Double {
        42500
    }

    func getDescription() -> String {
        "Range Rover EVOQUE"
    }
}

//4
class RangeRoverDecorator: RangeRover {
    
    //Сюда передаем автомобиль для которого используем дополнительные опции
    private let decorateRR: RangeRover
    required init(dRR: RangeRover) {
        decorateRR = dRR
    }
    
    func getPrice() -> Double {
        decorateRR.getPrice()
    }
    
    func getDescription() -> String {
        decorateRR.getDescription()
    }
}

//6
class Engine: RangeRoverDecorator {
    
    required init(dRR: RangeRover) {
        super.init(dRR: dRR)
    }
    
    override func getPrice() -> Double {
        super.getPrice() + 6000
    }
    
    override func getDescription() -> String {
        super.getDescription() + " Engine 3.0L (340HP)"
    }
}

class Panoramic: RangeRoverDecorator {
    
    required init(dRR: RangeRover) {
        super.init(dRR: dRR)
    }
    
    override func getPrice() -> Double {
        super.getPrice() + 5000
    }
    
    override func getDescription() -> String {
        super.getDescription() + " with panoramic sunroof"
    }
}

class AudioSystem: RangeRoverDecorator {
    
    required init(dRR: RangeRover) {
        super.init(dRR: dRR)
    }
    
    override func getPrice() -> Double {
        super.getPrice() + 3000
    }
    
    override func getDescription() -> String {
        super.getDescription() + " includes premium audio system"
    }
}

//Обязательно указывать тип! RangeRover
var velar: RangeRover = Velar()
velar.getPrice()
velar.getDescription()

velar = Engine(dRR: velar)
velar.getPrice()
velar.getDescription()

velar = Panoramic(dRR: velar)
velar.getPrice()
velar.getDescription()

velar = AudioSystem(dRR: velar)
velar.getPrice()
velar.getDescription()

var sport: RangeRover = Sport()
sport.getPrice()
sport.getDescription()

sport = AudioSystem(dRR: sport)
sport = Panoramic(dRR: sport)
sport.getPrice()
sport.getDescription()
