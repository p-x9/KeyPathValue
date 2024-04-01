//
//  ReferenceWritableKeyPathValueApplier.swift
//
//
//  Created by p-x9 on 2022/11/04.
//
//

import Foundation

/// Reference Writable KeyPath and  value applier
public struct ReferenceWritableKeyPathValueApplier<Root: AnyObject> {

    /// KeyPath to which you want to assign a value
    public let keyPath: PartialKeyPath<Root>
    /// assign value
    public let _apply: (Any, Root) -> Bool

    /// initialize with keyPath
    public init<Value>(_ keyPath: ReferenceWritableKeyPath<Root, Value>) {
        self.keyPath = keyPath
        self._apply = {
            guard let value = $0 as? Value else { return false }
            $1[keyPath: keyPath] = value
            return true
        }
    }

    /// assign value
    /// - Parameters:
    ///   - value: value to be assigned
    ///   - target: assign target
    /// - Returns: whether the assignment was successful or not. (type casting)
    @discardableResult
    public func apply(_ value: Any, to target: Root) -> Bool {
        _apply(value, target)
    }
}
