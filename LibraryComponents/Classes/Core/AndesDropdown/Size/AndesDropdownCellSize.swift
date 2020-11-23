//
//  AndesDropdownCellSize.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/11/20.
//

import Foundation

@objc public enum AndesDropdownCellSize: Int, AndesEnumStringConvertible {
    case small
    case medium
    case large

    public static func keyFor(_ value: AndesDropdownCellSize) -> String {
        switch value {
        case .small: return "SMALL"
        case .medium: return "MEDIUM"
        case .large: return "LARGE"
        }
    }
}
