//
//  AndesTextField+InterfaceBuilder.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/27/20.
//

import Foundation

public extension AndesTextField {
    internal func checkValidEnum<T: AndesEnumStringConvertible>(property: String, key: String) -> T {
        guard let value = T.fromString(key) else {
            fatalError("The available values for \(property) are \(T.allKeys)")
        }
        return value
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'type' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.type = checkValidEnum(property: "IB Type", key: val)
        }
        get {
            return ""
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'state' instead.")
    @IBInspectable var ibState: String {
        set(val) {
            self.state = checkValidEnum(property: "IB State", key: val)
        }
        get {
            return ""
        }
    }
}
