//: Playground - noun: a place where people can play

import UIKit

class Request: Hashable {
    var manager: String
    var company: String

    init(manager: String, company:String ) {
        self.company = company
        self.manager = manager
    }

    var hashValue: Int {
        return manager.djb2hash ^ company.sdbmhash
    }

    func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? Request {
            return (manager == object.manager) && (company == object.company)
        } else {
            return false
        }
    }

}

extension Request: Equatable {
    static func ==(lhs: Request, rhs: Request) -> Bool {
        return lhs.hashValue == rhs.hashValue
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

if (first == second) {
    print("Equal hash")
} else {
    print("Different hash")
}

print(first.hashValue)
print(second.hashValue)

var sampleSet = Set<Request>()
sampleSet.insert(first)
sampleSet.insert(second)

sampleSet.count
//sampleSet.map{print($0.company)}

var unsignedOverflow = UInt8.min
unsignedOverflow = unsignedOverflow &- 4
print(unsignedOverflow)



