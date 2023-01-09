//
//  Item.swift
//  
//
//  Created by p-x9 on 2022/12/19.
//  
//

import Foundation

struct StructItem {
    static let initial: StructItem = {
        .init()
    }()

    var number: Int = 0
    var object: Object = .init(string: "")

    private(set) var privateSetProperty: Double = 0
}

class ClassItem {
    static var initial: ClassItem {
        .init()
    }

    var number: Int = 0
    var object: Object = .init(string: "")

    private(set) var privateSetProperty: Double = 0
    
    init() {}
}

class Object: Equatable {
    static func == (lhs: Object, rhs: Object) -> Bool {
        lhs.string == rhs.string
    }

    var string: String

    init(string: String) {
        self.string = string
    }
}
