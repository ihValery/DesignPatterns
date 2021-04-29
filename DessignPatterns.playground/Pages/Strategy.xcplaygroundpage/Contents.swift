/*
 Шаги реализации:
1. Определите алгоритм, который подвержен частым изменениям. Также подойдёт алгоритм, имеющий несколько вариаций, которые выбираются во время выполнения программы.
2. Создайте интерфейс стратегий, описывающий этот алгоритм. Он должен быть общим для всех вариантов алгоритма.
3. Поместите вариации алгоритма в собственные классы, которые реализуют этот интерфейс.
4. В классе контекста создайте поле для хранения ссылки на текущий объект-стратегию, а также метод для её изменения. Убедитесь в том, что контекст работает с этим объектом только через общий интерфейс стратегий.
5. Клиенты контекста должны подавать в него соответствующий объект-стратегию, когда хотят, чтобы контекст вёл себя определённым образом.
 */
//2
protocol DevBehavior {
    func developer()
}
protocol ThinkBehavior {
    func think()
}
//3
class NotDev: DevBehavior {
    func developer() {
        print("Я не знаю что такое программирование")
    }
}
class Junior: DevBehavior {
    func developer() {
        print("Я junior разработчик")
    }
}
class Middle: DevBehavior {
    func developer() {
        print("Я middle разработчик")
    }
}
class Senior: DevBehavior  {
    func developer() {
        print("Я senior  разработчик")
    }
}
class Schoolboy: ThinkBehavior {
    func think() {
        print("Я только учуть думать")
    }
}
class Student: ThinkBehavior {
    func think() {
        print("Я учуть думать и применять свои знания")
    }
}
class Professor: ThinkBehavior {
    func think() {
        print("Я учу других думать правильно. Я человек разумный )))")
    }
}
//Класс контекста (удаляем методы developer() и think())
//Создаем поле для хранения ссылки на текущий объект-стратегию, а также метод для её изменения.
class Human {
    
    //4
    private var devBehavior: DevBehavior?
    private var thinkBehavior: ThinkBehavior
    
    init(devBehavior: DevBehavior? = nil, thinkBehavior: ThinkBehavior) {
        self.devBehavior = devBehavior
        self.thinkBehavior = thinkBehavior
    }
    
    func performDeveloper() {
        devBehavior?.developer() ?? NotDev().developer()
    }
    
    func performThink() {
        thinkBehavior.think()
    }
    
    func setDevBehavior(devBehavior: DevBehavior) {
        self.devBehavior = devBehavior
    }
    func setThinkBehavior(thinkBehavior: ThinkBehavior) {
        self.thinkBehavior = thinkBehavior
    }
    
    func run() {
        print("Я умею бегать")
    }
}
//5
var human = Human(devBehavior: nil, thinkBehavior: Schoolboy())
//1 human.developer()
human.run()
human.performThink()
human.performDeveloper()
print("\nПрошел еще год")
human = Human(devBehavior: Junior(), thinkBehavior: Student())
human.performThink()
human.performDeveloper()
print("\nПрошел еще год")
human.setDevBehavior(devBehavior: Middle())
human.performThink()
human.performDeveloper()
print("\nПрошел еще год")
human.setDevBehavior(devBehavior: Senior())
human.performThink()
human.performDeveloper()
print("\nПрошел еще год")
human.setThinkBehavior(thinkBehavior: Professor())
human.performThink()
human.performDeveloper()
