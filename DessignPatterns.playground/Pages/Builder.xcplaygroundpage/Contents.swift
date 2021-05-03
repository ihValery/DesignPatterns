/*
 Шаги реализации

 1. Убедитесь в том, что создание разных представлений объекта можно свести к общим шагам.
 2. Опишите эти шаги в общем интерфейсе строителей.
 3. Для каждого из представлений объекта-продукта создайте по одному классу-строителю и реализуйте их методы строительства.
    Не забудьте про метод получения результата. Обычно конкретные строители определяют собственные методы получения результата строительства. Вы не можете описать эти методы в интерфейсе строителей, поскольку продукты не обязательно должны иметь общий базовый класс или интерфейс. Но вы всегда сможете добавить метод получения результата в общий интерфейс, если ваши строители производят однородные продукты с общим предком.
 4. Подумайте о создании класса директора. Его методы будут создавать различные конфигурации продуктов, вызывая разные шаги одного и того же строителя.
 5. Клиентский код должен будет создавать и объекты строителей, и объект директора. Перед началом строительства клиент должен связать определённого строителя с директором. Это можно сделать либо через конструктор, либо через сеттер, либо подав строителя напрямую в строительный метод директора.
 6. Результат строительства можно вернуть из директора, но только если метод возврата продукта удалось поместить в общий интерфейс строителей. Иначе вы жёстко привяжете директора к конкретным классам строителей.
 */

import SwiftUI

//1
protocol ThemeProtocol {
    var name: String { get }
    var color: Color { get }
    var arrayEmoji: [String] { get }
    var numberCard: Int { get }
}

class Helloween: ThemeProtocol {
    var name: String
    var color: Color
    var arrayEmoji: [String]
    var numberCard: Int
    
    init(name: String, color: Color, emoji: [String], number: Int) {
        self.name = name
        self.color = color
        arrayEmoji = emoji
        numberCard = number
    }
}

//2
protocol ThemeBilderProtocol {
    func setName(_ name: String) -> String?
    func setColor(_ color: Color)
    func setEmoji(array: [String])
    func setNumber(card number: Int)
    func createTheme() -> ThemeProtocol?
}

class ThemeBuilder: ThemeBilderProtocol {
    
    private var name: String?
    private var color: Color?
    private var arrayEmoji: [String]?
    private var numberCard: Int?
    
    func setName(_ name: String) -> String? {
        self.name = name
        return self.name
    }
    
    func setColor(_ color: Color) {
        self.color = color
    }
    
    func setEmoji(array: [String]) {
        arrayEmoji = array
    }
    
    func setNumber(card number: Int) {
        numberCard = number
    }
    
    func createTheme() -> ThemeProtocol? {
        guard let name = name, let color = color, let emoji = arrayEmoji, let number = numberCard else { return nil }
        return Helloween(name: name, color: color, emoji: emoji, number: number)
    }
}

let builder = ThemeBuilder()
builder.setName("Helloween")
builder.setColor(.orange)
builder.setNumber(card: 9)
builder.setEmoji(array: ["1", "2", "3"])
builder.createTheme()
