/*
 Шаги реализации
1. Создайте общий интерфейс итераторов. Обязательный минимум — это операция получения следующего элемента коллекции. Но для удобства можно предусмотреть и другое. Например, методы для получения предыдущего элемента, текущей позиции, проверки окончания обхода и прочие.
2. Создайте интерфейс коллекции и опишите в нём метод получения итератора. Важно, чтобы сигнатура метода возвращала общий интерфейс итераторов, а не один из конкретных итераторов.
3. Создайте классы конкретных итераторов для тех коллекций, которые нужно обходить с помощью паттерна. Итератор должен быть привязан только к одному объекту коллекции. Обычно эта связь устанавливается через конструктор.
4. Реализуйте методы получения итератора в конкретных классах коллекций. Они должны создавать новый итератор того класса, который способен работать с данным типом коллекции. Коллекция должна передавать ссылку на собственный объект в конструктор итератора.
5. В клиентском коде и в классах коллекций не должно остаться кода обхода элементов. Клиент должен получать новый итератор из объекта коллекции каждый раз, когда ему нужно перебрать её элементы.
 */

/*
//Пример как работает итератор через for in
let array = [1, 2, 3, 4, 5]
for i in array {
    print("for \(i) in \(array)")
}
var iterator = array.makeIterator()
while let item = iterator.next() {
    print("while let \(item) = \(iterator).next")
}
*/

class Player {

    let name: String
    let isReputation: Bool
    
    init(name: String, reputation: Bool) {
        self.name = name
        isReputation = reputation
    }
}

//2
class Basketball {
    
    //4
    var repIterator: GoodIterator {
        GoodIterator(players: players)
    }
    
    var repBadIterator: BadIterator {
        BadIterator(players: players)
    }
    
    private let players = [Player(name: "Vova", reputation: false),
                           Player(name: "Mark", reputation: true),
                           Player(name: "Yan", reputation: true),
                           Player(name: "Oleg", reputation: true),
                           Player(name: "Niger", reputation: true),]
}

//3
class GoodIterator: IteratorProtocol {
    
    private let indexPlayers: [Player]
    private var current = 0
    
    init(players: [Player]) {
        indexPlayers = players.filter { $0.isReputation == true }
    }
    
    func next() -> Player? {
        //Оператор отложенных действий (отложить)
        defer { current += 1 }
        return indexPlayers.count > current ? indexPlayers[current] : nil
    }
    
    func allGood() -> [Player?] {
        indexPlayers
    }
}

class BadIterator: IteratorProtocol {
    
    private let indexPlayers: [Player]
    private var current = 0
    
    init(players: [Player]) {
        indexPlayers = players.filter { $0.isReputation == false }
    }
    
    func next() -> Player? {
        //Оператор отложенных действий (отложить)
        defer { current += 1 }
        return indexPlayers.count > current ? indexPlayers[current] : nil
    }
    
    func allBad() -> [Player?] {
        indexPlayers
    }
}

let player = Basketball()
player.repIterator.next()
player.repIterator.allGood()
player.repBadIterator.allBad()
