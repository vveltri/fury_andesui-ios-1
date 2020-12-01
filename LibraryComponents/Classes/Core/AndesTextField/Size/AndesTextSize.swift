//
//  AndesTextSize.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 1/12/20.
//

import Foundation

@objc public enum AndesTextSize: Int, AndesEnumStringConvertible {
    case small
    case medium
    case large

    public static func keyFor(_ value: AndesTextSize) -> String {
        switch value {
        case .small: return "SMALL"
        case .medium: return "MEDIUM"
        case . large: return "LARGE"
        }
    }
}
