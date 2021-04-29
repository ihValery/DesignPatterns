/*
 Шаги реализации

 1. Разбейте вашу функциональность на две части: независимое ядро и опциональные зависимые части. Независимое ядро станет издателем. Зависимые части станут подписчиками.
 2. Создайте интерфейс подписчиков. Обычно в нём достаточно определить единственный метод оповещения.
 3. Создайте интерфейс издателей и опишите в нём операции управления подпиской. Помните, что издатель должен работать только с общим интерфейсом подписчиков.
 4. Вам нужно решить, куда поместить код ведения подписки, ведь он обычно бывает одинаков для всех типов издателей. Самый очевидный способ — вынести этот код в промежуточный абстрактный класс, от которого будут наследоваться все издатели.
 Но если вы интегрируете паттерн в существующие классы, то создать новый базовый класс может быть затруднительно. В этом случае вы можете поместить логику подписки во вспомогательный объект и делегировать ему работу из издателей.
 5. Создайте классы конкретных издателей. Реализуйте их так, чтобы после каждого изменения состояния они отправляли оповещения всем своим подписчикам.
 6.Реализуйте метод оповещения в конкретных подписчиках. Не забудьте предусмотреть параметры, через которые издатель мог бы отправлять какие-то данные, связанные с происшедшим событием.
 Возможен и другой вариант, когда подписчик, получив оповещение, сам возьмёт из объекта издателя нужные данные. Но в этом случае вы будете вынуждены привязать класс подписчика к конкретному
 классу издателя.
 7. Клиент должен создавать необходимое количество объектов подписчиков и подписывать их у издателей.
 */

import Foundation

//3
protocol Subscription {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString news: String)
}

//5
class SuperStar: Subscription {
    
    //Можем изменять и все объекты уникальны
    var observerCollection = NSMutableSet()
    
    //Новое значение из news помещяем в notify, который вызывает у каждого подписчика метот didGet
    var news = "" {
        didSet {
            notify(withString: news)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString news: String) {
        for index in observerCollection {
            //Что бы обратиться к методу который реализоват в protocol PropertyObserver
            (index as! PropertyObserver).didGet(getNews: news)
        }
    }
}

//2
protocol PropertyObserver {
    //6
    func didGet(getNews: String)
}

//NSObject для того что бы помеcтить нашего подписчика Subscriber в NSMutableSet
class Subscriber: NSObject, PropertyObserver {
    
    var news = ""
    
    func didGet(getNews: String) {
        news = getNews
        print("Новости которые вы хотели увидеть")
    }
}

let superStar = SuperStar()
let subscriber1 = Subscriber()
let subscriber2 = Subscriber()
let subscriber3 = Subscriber()

superStar.add(observer: subscriber1)
superStar.add(observer: subscriber2)
superStar.add(observer: subscriber3)

superStar.notify(withString: "А вы видели крутой Zoom")
subscriber1.news
superStar.news = "Я обновил версию зума до 2.0"
subscriber3.news
subscriber2.news
