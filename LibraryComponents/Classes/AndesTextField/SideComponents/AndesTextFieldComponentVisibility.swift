//
//  AndesTextFieldComponentVisibility.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/2/20.
//

import Foundation

@objc internal enum AndesTextFieldComponentVisibility: Int, AndesEnumStringConvertible {
    case always
    case whenNotEmpty

    internal static func keyFor(_ value: AndesTextFieldComponentVisibility) -> String {
        switch value {
        case .always: return "ALWAYS"
        case .whenNotEmpty: return "WHEN_NOT_EMPTY"
        }
    }
}
