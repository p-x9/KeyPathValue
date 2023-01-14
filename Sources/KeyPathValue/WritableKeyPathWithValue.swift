//
//  WritableKeyPathWithValue.swift
//  
//
//  Created by p-x9 on 2022/11/04.
//  
//

import Foundation

/// Writable KeyPath and value
public struct WritableKeyPathWithValue<Root> {

    /// KeyPath to which you want to assign a value
    public let keyPath: PartialKeyPath<Root>
    /// Value to be assigned
    public let value: Any
    /// assign value
    public let _apply: (inout Root) -> Void

    /// initialize with writable keyPath and value
    public init<Value>(_ keyPath: WritableKeyPath<Root, Value>, _ value: Value) {
        self.keyPath = keyPath
        self.value = value
        self._apply = { $0[keyPath: keyPath] = value }
    }

    /// initialize with partial keyPath and value
    @_disfavoredOverload
    public init?<Value>(_ keyPath: PartialKeyPath<Root>, _ value: Value) {
        guard let keyPath = keyPath as? WritableKeyPath<Root, Value> else {
            return nil
        }

        self.init(keyPath, value)
    }

    /// assign value
    public func apply(to target: inout Root) {
        _apply(&target)
    }
}

extension WritableKeyPathWithValue {
    public init(_ keyValueApplier: WritableKeyPathValueApplier<Root>, value: Any) {
        self.keyPath = keyValueApplier.keyPath
        self.value = value
        self._apply = {
            keyValueApplier.apply(value, to: &$0)
        }
    }
}
