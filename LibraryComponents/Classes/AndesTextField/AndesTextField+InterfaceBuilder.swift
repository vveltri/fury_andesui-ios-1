//
//  AndesTextField+InterfaceBuilder.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/27/20.
//

import Foundation

public extension AndesTextField {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'setLabel' instead.")
    @IBInspectable var ibLabelText: String {
        set(val) {
            self.labelText = val
        }
        get {
            return ""
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'setPlaceholder' instead.")
    @IBInspectable var ibPlaceholderText: String {
        set(val) {
            self.placeholderText = val
        }
        get {
            return ""
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'setHelperText' instead.")
    @IBInspectable var ibHelperText: String {
        set(val) {
            self.helperText = val
        }
        get {
            return ""
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'setHelperText' instead.")
    @IBInspectable var ibType: String {
        set(val) {
            self.helperText = val
        }
        get {
            return ""
        }
    }
}
