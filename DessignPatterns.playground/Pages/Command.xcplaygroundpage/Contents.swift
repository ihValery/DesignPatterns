/*
Шаги реализации

1. Создайте общий интерфейс команд и определите в нём метод запуска.
2. Один за другим создайте классы конкретных команд. В каждом классе должно быть поле для хранения ссылки на один или несколько объектов-получателей, которым команда будет перенаправлять основную работу.
    Кроме этого, команда должна иметь поля для хранения параметров, которые нужны при вызове методов получателя. Значения всех этих полей команда должна получать через конструктор.
    И наконец, реализуйте основной метод команды, вызывая в нём те или иные методы получателя.
3. Добавьте в классы отправителей поля для хранения команд. Объект-отправитель должен принимать готовый объект команды извне через конструктор, либо через сеттер команды.
4. Измените основной код отправителей так, чтобы они делегировали выполнение действия команде.
5. Порядок инициализации объектов должен выглядеть так:
     Создаём объекты получателей.
     Создаём объекты команд, связав их с получателями.
     Создаём объекты отправителей, связав их с командами.
 */

//1
class Account {
    
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}

//И наконец, реализуйте основной метод команды, вызывая в нём те или иные методы получателя.
protocol Command {
    
    var isComplete: Bool { get set }
    func execute()
}

//2
class Deposit: Command {
    
    //_ у private свойст - дополнительное выделение, что данное свойство не выйде из класса
    //синтаксис некоторых программистов
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        _account = account
        _amount = amount
    }
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
}

class Withdraw: Command {

    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        _account = account
        _amount = amount
    }
    
    func execute() {
        if _account.balance > _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("Недостаточно средств")
        }
    }
}

//3
class TransactionManager {
    
    static let shared = TransactionManager()
    private init() {}

    //Добавьте в классы отправителей поля для хранения команд.
    private var _transactions: [Command] = []
    
    var pendingTransactions: [Command] {
        get {
            return self._transactions.filter { $0.isComplete == false }
        }
    }
    
    func addTransactions(command: Command) {
        self._transactions.append(command)
    }
    
    func processingTransactions() {
        _transactions.filter { $0.isComplete == false }.forEach { $0.execute() }
    }
}

let account = Account(accountName: "k.0ff", balance: 500000)
let transactionManager = TransactionManager.shared
transactionManager.addTransactions(command: Deposit(account: account, amount: 100000))
transactionManager.pendingTransactions
account.balance
transactionManager.processingTransactions()
account.balance
transactionManager.pendingTransactions
transactionManager.addTransactions(command: Withdraw(account: account, amount: 49500))
account.balance
transactionManager.addTransactions(command: Withdraw(account: account, amount: 1300))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 800))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 750))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 250))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 200))
transactionManager.addTransactions(command: Withdraw(account: account, amount: 1500))
transactionManager.pendingTransactions.count
account.balance
transactionManager.processingTransactions()
account.balance
transactionManager.addTransactions(command: Withdraw(account: account, amount: 45700))
transactionManager.processingTransactions()
account.balance
transactionManager.addTransactions(command: Withdraw(account: account, amount: 500001))
transactionManager.processingTransactions()
transactionManager.pendingTransactions
account.balance
