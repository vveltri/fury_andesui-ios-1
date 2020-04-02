//
//  AndesTextFieldType.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

/// Used to define type of textfield
@objc public enum AndesTextFieldType: Int, AndesEnumStringConvertible {
    case simple
    case textArea

    static func keyFor(_ value: AndesTextFieldType) -> String {
        switch value {
        case .simple:
            return "SIMPLE"
        case .textArea:
            return "TEXT_AREA"
        }
    }
}
