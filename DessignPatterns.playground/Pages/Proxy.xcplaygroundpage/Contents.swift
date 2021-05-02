/*
 Шаги реализации

1. Определите интерфейс, который бы сделал заместитель и оригинальный объект взаимозаменяемыми.
2. Создайте класс заместителя. Он должен содержать ссылку на сервисный объект. Чаще всего, сервисный объект создаётся самим заместителем. В редких случаях заместитель получает готовый сервисный объект от клиента через конструктор.
3. Реализуйте методы заместителя в зависимости от его предназначения. В большинстве случаев, проделав какую-то полезную работу, методы заместителя должны передать запрос сервисному объекту.
4. Подумайте о введении фабрики, которая решала бы, какой из объектов создавать — заместитель или реальный сервисный объект. Но, с другой стороны, эта логика может быть помещена в создающий метод самого заместителя.
5. Подумайте, не реализовать ли вам ленивую инициализацию сервисного объекта при первом обращении клиента к методам заместителя.
 */


/*
//Виртуальный прокси
class User {
    var id = "k.0ff"
}

//1
protocol ServerProtocol {
    func grandAccess(user: User)
    func denyAccess(user: User)
}

class ServerSide: ServerProtocol {
    func grandAccess(user: User) {
        print("Доступ предоставлен пользователю с идентификатором \(user.id)")
    }
    
    func denyAccess(user: User) {
        print("В доступе отказано пользователю с идентификатором \(user.id)")
    }
}

//2
class ServerProxy: ServerProtocol {
    //5
    lazy private var server = ServerSide()
    
    func grandAccess(user: User) {
        print("Пользователю с идентификатором \(user.id) обратился к proxy\nОбработка запроса ...")
        //3
        server.grandAccess(user: user)
    }
    
    func denyAccess(user: User) {
        print("Пользователю с идентификатором \(user.id) обратился к proxy\nОбработка запроса ...")
        server.denyAccess(user: user)
    }
}

let user = User()
let proxy = ServerProxy()
proxy.grandAccess(user: user)
proxy.denyAccess(user: user)
*/

//Защитный proxy
class User {
    let name = "k.0ff"
    let passport = "0ff"
}

protocol ServerProtocol {
    func grandAccess(user: User)
}

class ServerSide: ServerProtocol {
    func grandAccess(user: User) {
        print("Доступ предоставлен пользователю с идентификатором \(user.name)")
    }
}

class ServerProxy: ServerProtocol {
    
    private var server: ServerSide!

    func grandAccess(user: User) {
        guard server != nil else {
            print("В доступе отказанно")
            return
        }
        server.grandAccess(user: user)
    }
    
    func authenticate(user: User) {
        guard user.passport == "0ff" else { return }
        print("Юзет авторизирован")
        server = ServerSide()
    }
}

let user = User()
let proxy = ServerProxy()
proxy.grandAccess(user: user)
proxy.authenticate(user: user)
proxy.grandAccess(user: user)

