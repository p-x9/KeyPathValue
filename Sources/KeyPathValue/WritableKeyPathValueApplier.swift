//
//  WritableKeyPathValueApplier.swift
//  
//
//  Created by p-x9 on 2022/11/04.
//  
//

import Foundation

/// Writable KeyPath and value applier
public struct WritableKeyPathValueApplier<Root> {

    /// KeyPath to which you want to assign a value
    public let keyPath: PartialKeyPath<Root>
    /// assign value
    public let apply: (Any, inout Root) -> Void

    /// initialize with keyPath
    public init<Value>(_ keyPath: WritableKeyPath<Root,Value>) {
        self.keyPath = keyPath
        self.apply = {
            guard let value = $0 as? Value else { return }
            $1[keyPath: keyPath] = value
        }
    }
}
