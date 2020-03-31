//
//  AndesTextFieldInputTrait.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/27/20.
//

import Foundation

@objc public enum AndesTextFieldInpuTraits: Int {
    case password
    case email
    case numberPad
    case custom
}

internal class AndesTextInputTraitsFactory: NSObject {
    static func getTraits(for type: AndesTextFieldInpuTraits) -> UITextInputTraits? {
        switch type {
        case .password:
            return AndesTextInputTraitsPassword()
        case .email:
            return AndesTextInputTraitsEmail()
        case .numberPad:
            return AndesTextInputTraitsNumberPad()
        case .custom:
            return nil
        }
    }
}

@objc class AndesTextInputTraitsEmail: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .emailAddress
    var textContentType: UITextContentType! = .emailAddress
}

@objc class AndesTextInputTraitsPassword: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .default
    var isSecureTextEntry: Bool = true
}

@objc class AndesTextInputTraitsNumberPad: NSObject, UITextInputTraits {
    var keyboardType: UIKeyboardType = .numberPad
}
