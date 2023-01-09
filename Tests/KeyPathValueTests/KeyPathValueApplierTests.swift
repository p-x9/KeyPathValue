//
//  KeyPathValueApplierTests.swift
//  
//
//  Created by p-x9 on 2023/01/08.
//  
//

import XCTest
@testable import KeyPathValue

final class KeyPathValueApplierTests: XCTestCase {

    var classItem = ClassItem()
    var structItem = StructItem()

    override func setUp() {
        classItem = ClassItem()
        structItem = StructItem()
    }

    func testWritableKeyPathValueApplier() {
        var applier: WritableKeyPathValueApplier<StructItem>

        applier = .init(\.number)
        applier.apply(123, &structItem)

        applier = .init(\.object)
        applier.apply(Object(string: "123"), &structItem)

        XCTAssertEqual(structItem.number, 123)
        XCTAssertEqual(structItem.object, .init(string: "123"))
    }

    func testReferenceWritableKeyPathValueApplier() {
        var applier: ReferenceWritableKeyPathValueApplier<ClassItem>

        applier = .init(\.number)
        applier.apply(123, classItem)

        applier = .init(\.object)
        applier.apply(Object(string: "123"), classItem)

        XCTAssertEqual(classItem.number, 123)
        XCTAssertEqual(classItem.object, .init(string: "123"))
    }
}
