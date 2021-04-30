/*
Шаги реализации

1. Убедитесь, что вашу бизнес-логику можно представить как древовидную структуру. Попытайтесь разбить её на простые компоненты и контейнеры. Помните, что контейнеры могут содержать как простые компоненты, так и другие вложенные контейнеры.
2. Создайте общий интерфейс компонентов, который объединит операции контейнеров и простых компонентов дерева. Интерфейс будет удачным, если вы сможете использовать его, чтобы взаимозаменять простые и составные компоненты без потери смысла.
3. Создайте класс компонентов-листьев, не имеющих дальнейших ответвлений. Имейте в виду, что программа может содержать несколько таких классов.
4. Создайте класс компонентов-контейнеров и добавьте в него массив для хранения ссылок на вложенные компоненты. Этот массив должен быть способен содержать как простые, так и составные компоненты, поэтому убедитесь, что он объявлен с типом интерфейса компонентов.
    Реализуйте в контейнере методы интерфейса компонентов, помня о том, что контейнеры должны делегировать основную работу своим дочерним компонентам.
5. Добавьте операции добавления и удаления дочерних компонентов в класс контейнеров.
    Имейте в виду, что методы добавления/удаления дочерних компонентов можно поместить и в интерфейс компонентов. Да, это нарушит принцип разделения интерфейса, так как реализации методов будут пустыми в компонентах-листьях. Но зато все компоненты дерева станут действительно одинаковыми для клиента.
 */

//2
protocol Coworker {
    var  level: Int { get }
    
    func hire(coworker: Coworker)
    func getInfo()
}

//4
class Manager: Coworker {
    
    private var coworkers: [Coworker] = []
    var level: Int
    
    init(level: Int) {
        self.level = level
    }
    
    func hire(coworker: Coworker) {
        coworkers.append(coworker)
    }
    
    func getInfo() {
        print(level.description + " уровень менеджера")
        for index in coworkers {
            index.getInfo()
        }
    }
}

//3
class LowLevelManager: Coworker {

    var level: Int
    
    init(level: Int) {
        self.level = level
    }
    
    func hire(coworker: Coworker) {
        print("Вы не можете нанять подчененного")
    }
    
    func getInfo() {
        print(level.description + " уровень менеджера")
    }
}

let topManager = Manager(level: 1)
//topManager.getInfo()
let coworker = LowLevelManager(level: 10)
//topManager.hire(coworker: coworker)
//topManager.getInfo()
//coworker.hire(coworker: coworker)

let managerL_2 = Manager(level: 2)
let managerL_3_1 = Manager(level: 3)
let managerL_3_2 = Manager(level: 3)

topManager.hire(coworker: managerL_2)
managerL_2.hire(coworker: managerL_3_1)
managerL_2.hire(coworker: managerL_3_2)
managerL_3_1.hire(coworker: coworker)

topManager.getInfo()
