# KeyPathValue
Structure for assigning values using keypath

## Example
### ReferenceWritableKeyPathValueApplier
Suppose we have the following model.
```swift
struct CALayerModel {
    var bounds: CGRect?
    var position: CGPoint?
    var frame: CGRect?

    var backgroundColor: CGColor?

    var cornerRadius: CGFloat?

    var borderWidth: CGFloat?
    var borderColor: CGColor?
}
```
Define propertyMap using `ReferenceWritableKeyPathValueApplier`

```swift
let propertyMap: [PartialKeyPath<CALayerModel>: ReferenceWritableKeyPathValueApplier<CALayer>] = [
        \.bounds: .init(\.bounds),
         \.position: .init(\.position),
         \.frame: .init(\.frame),
         \.backgroundColor: .init(\.backgroundColor),
         \.cornerRadius: .init(\.cornerRadius),
         \.borderWidth: .init(\.borderWidth),
         \.borderColor: .init(\.borderColor)
    ]
```
Can be assigned to an object using propertyMap.
```swift
extension CALayerModel {
    public func applyProperties(to target: CALayer) {
        Self.propertyMap.forEach { keyPath, applier in
            let value = self[keyPath: keyPath]
            applier.apply(value, target)
        }
    }
}

```