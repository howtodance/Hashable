//: Playground - noun: a place where people can play

import UIKit

class Request: NSObject {
    var manager: String
    var company: String

    init(manager: String, company:String ) {
        self.company = company
        self.manager = manager
    }

    override var hash: Int {
        return manager.djb2hash ^ company.djb2hash
        //return manager.djb2hash ^ company.sdbmhash
    }

    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Request {
            return (manager == object.manager) && (company == object.company)
        } else {
            return false
        }
    }

}

extension String {
    var djb2hash: Int {
        let unicodeScalars = self.unicodeScalars.map { $0.value }
        return unicodeScalars.reduce(5381) {

            ($0 << 5) &+ $0 &+ Int($1)
        }
    }

    var sdbmhash: Int {
        let unicodeScalars = self.unicodeScalars.map { $0.value }
        return unicodeScalars.reduce(0) {
            Int($1) &+ ($0 << 6) &+ ($0 << 16) - $0
        }
    }
}

let first = Request(manager: "Johns", company: "Papa")
let second = Request(manager: "Papa", company: "Johns")
//let second = Request(manager: "Johns", company: "Papa")

first.isEqual(second)
first.hash
second.hash


var set = Set<Request>()

set.insert(first)
set.insert(second)

set.count



