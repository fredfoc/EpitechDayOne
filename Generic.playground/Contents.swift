//: Playground - noun: a place where people can play

import Foundation



class Display<Value: CustomStringConvertible> {
    var maValeur: Value?
    private var _desc: String?
    var desc: String? {
        return maValeur?.description
    }
}

let display1 = Display<String>()
display1.maValeur = "Fred"
print(display1.desc)

let display2 = Display<Int>()
display2.maValeur = 10
print(display2.desc)
