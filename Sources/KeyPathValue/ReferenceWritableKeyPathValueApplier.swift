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
    public let apply: (Any, Root) -> Void

    /// initialize with keyPath
    public init<Value>(_ keyPath: ReferenceWritableKeyPath<Root,Value>) {
        self.keyPath = keyPath
        self.apply = {
            guard let value = $0 as? Value else { return }
            $1[keyPath: keyPath] = value
        }
    }
}
