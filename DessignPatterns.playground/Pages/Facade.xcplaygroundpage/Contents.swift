/*
Шаги реализации

1. Определите, можно ли создать более простой интерфейс, чем тот, который предоставляет сложная подсистема. Вы на правильном пути, если этот интерфейс избавит клиента от необходимости знать о подробностях подсистемы.
2. Создайте класс фасада, реализующий этот интерфейс. Он должен переадресовывать вызовы клиента нужным объектам подсистемы. Фасад должен будет позаботиться о том, чтобы правильно инициализировать объекты подсистемы.
3. Вы получите максимум пользы, если клиент будет работать только с фасадом. В этом случае изменения в подсистеме будут затрагивать только код фасада, а клиентский код останется рабочим.
4. Если ответственность фасада начинает размываться, подумайте о введении дополнительных фасадов.
 */

class Basketball {
    func playBasket() -> String {
        "Я ищу игроков для совместной игры иаскетбол"
    }
}

class Football {
    func playFootbik() -> String {
        "Я ищу игроков для совместной игры футбол"
    }
}

class Tennis {
    func playTennis() -> String {
        "Я ищу партнера для игры в тенис"
    }
}

class Running {
    func goRun() -> String {
        "Я не против попробовать пробежаться вместе"
    }
}

class Workout {
    func goGym() -> String {
        "Подстрахую на жиме лежа. Жму 180 кг."
    }
}

//2
class LetsGoPlay {
    
    private let basket = Basketball()
    private let footbik = Football()
    private let tennis = Tennis()
    private let run = Running()
    private let gym = Workout()
    
    func gameSelection() -> String {
        var games = ""
        games += basket.playBasket() + ", "
        games += footbik.playFootbik() + ", "
        games += tennis.playTennis() + ", "
        games += run.goRun() + ", "
        games += gym.goGym()
        return games
    }
}

let sm = LetsGoPlay()
sm.gameSelection()

//LetsGoPlay неудачный пример (((
