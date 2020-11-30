//
//  AndesDropdownCellType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public enum AndesDropdownCellType: Int, AndesEnumStringConvertible {
    case isSelectable
    case checkBox
    case none

    public static func keyFor(_ value: AndesDropdownCellType) -> String {
        switch value {
        case .isSelectable: return " IS_SELECTABLE"
        case .checkBox: return "CHECKBOX"
        case .none: return "NONE"
        }
    }
}
