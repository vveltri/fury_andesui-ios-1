//
//  AndesBadgeModifier.swift
//  AndesUI
//

import Foundation

/// Used to define the type of an AndesBadge
@objc public enum AndesBadgeModifier: Int, AndesEnumStringConvertible {
    case pill

    public static func keyFor(_ value: AndesBadgeModifier) -> String {
        switch value {
        case .pill: return "PILL"
        }
    }
}
