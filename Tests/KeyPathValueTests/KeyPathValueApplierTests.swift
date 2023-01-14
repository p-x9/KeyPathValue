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
        var isSucceeded: Bool

        applier = .init(\.number)
        isSucceeded = applier.apply(123, to: &structItem)
        XCTAssertTrue(isSucceeded)

        applier = .init(\.object)
        isSucceeded = applier.apply(Object(string: "123"), to: &structItem)
        XCTAssertTrue(isSucceeded)

        XCTAssertEqual(structItem.number, 123)
        XCTAssertEqual(structItem.object, .init(string: "123"))

        // fails
        applier = .init(\.number)
        isSucceeded = applier.apply("123", to: &structItem)
        XCTAssertFalse(isSucceeded)

        applier = .init(\.object)
        isSucceeded = applier.apply("123", to: &structItem)
        XCTAssertFalse(isSucceeded)
    }

    func testReferenceWritableKeyPathValueApplier() {
        var applier: ReferenceWritableKeyPathValueApplier<ClassItem>
        var isSucceeded: Bool

        applier = .init(\.number)
        isSucceeded = applier.apply(123, to: classItem)
        XCTAssertTrue(isSucceeded)

        applier = .init(\.object)
        isSucceeded = applier.apply(Object(string: "123"), to: classItem)
        XCTAssertTrue(isSucceeded)

        XCTAssertEqual(classItem.number, 123)
        XCTAssertEqual(classItem.object, .init(string: "123"))


        // fails
        applier = .init(\.number)
        isSucceeded = applier.apply("123", to: classItem)
        XCTAssertFalse(isSucceeded)

        applier = .init(\.object)
        isSucceeded = applier.apply("123", to: classItem)
        XCTAssertFalse(isSucceeded)
    }
}
