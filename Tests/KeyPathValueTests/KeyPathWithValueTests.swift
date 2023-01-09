import XCTest
@testable import KeyPathValue

final class KeyPathWithValueTests: XCTestCase {

    var classItem = ClassItem()
    var structItem = StructItem()

    override func setUp() {
        classItem = ClassItem()
        structItem = StructItem()
    }

    func testWritableKeyPathWithValue() {
        let appliers: [WritableKeyPathWithValue<StructItem>] = [
            .init(\.number, 123),
            .init(\.object, .init(string: "123"))
        ]

        appliers.forEach { applier in
            applier.apply(&structItem)
        }

        XCTAssertEqual(structItem.number, 123)
        XCTAssertEqual(structItem.object, .init(string: "123"))
    }

    func testReferenceWritableKeyPathWithValue() {
        let appliers: [ReferenceWritableKeyPathWithValue<ClassItem>] = [
            .init(\.number, 123),
            .init(\.object, .init(string: "123"))
        ]

        appliers.forEach { applier in
            applier.apply(classItem)
        }

        XCTAssertEqual(classItem.number, 123)
        XCTAssertEqual(classItem.object, .init(string: "123"))
    }

    func testWritableKeyPathWithValuePrivateSet() {
        let applier = WritableKeyPathWithValue<StructItem>(\.privateSetProperty, 123.0)

        applier?.apply(&structItem)

        XCTAssertEqual(structItem.privateSetProperty, 123.0)
    }

    func testReferenceWritableKeyPathWithValuePrivateSet() {
        let applier = ReferenceWritableKeyPathWithValue<ClassItem>(\.privateSetProperty, 123.0)

        applier?.apply(classItem)

        XCTAssertEqual(classItem.privateSetProperty, 123.0)
    }
}
