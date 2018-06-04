//: Playground - noun: a place where people can play

import UIKit

struct BaseBus: Equatable {
    var brand: String
    var capacity: Int
    var requests: [Moto]
}

func == (lhs: BaseBus, rhs: BaseBus) -> Bool {
    return lhs.brand == rhs.brand && lhs.capacity == rhs.capacity && lhs.requests == rhs.requests
}


struct Moto { //: { Equatable {
    var fara: String
}

//func == (lhs: Moto, rhs: Moto) -> Bool {
//    return lhs.fara == rhs.fara
//}

