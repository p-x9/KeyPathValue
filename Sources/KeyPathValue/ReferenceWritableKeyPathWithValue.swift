//
//  ReferenceWritableKeyPathWithValue.swift
//  
//
//  Created by p-x9 on 2022/11/04.
//  
//

import Foundation

/// Reference Writable KeyPath and value
public struct ReferenceWritableKeyPathWithValue<Root: AnyObject> {

    /// KeyPath to which you want to assign a value
    public let keyPath: PartialKeyPath<Root>
    /// Value to be assigned
    public let value: Any
    /// assign value
    public let apply: (Root) -> Void

    /// initialize with reference writable keyPath and value
    public init<Value>(_ keyPath: ReferenceWritableKeyPath<Root, Value>, _ value: Value) {
        self.keyPath = keyPath
        self.value = value
        self.apply = { $0[keyPath: keyPath] = value }
    }

    /// initialize with partial keyPath and value
    @_disfavoredOverload
    public init?<Value>(_ keyPath: PartialKeyPath<Root>, _ value: Value) {
        guard let keyPath = keyPath as? ReferenceWritableKeyPath<Root, Value> else {
            return nil
        }

        self.init(keyPath, value)
    }
}

extension ReferenceWritableKeyPathWithValue {
    public init(_ keyValueApplier: ReferenceWritableKeyPathValueApplier<Root>, value: Any) {
        self.keyPath = keyValueApplier.keyPath
        self.value = value
        self.apply = {
            keyValueApplier.apply(value, $0)
        }
    }
}
