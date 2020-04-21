//
//  AndesBadgeModifier.swift
//  AndesUI
//

import Foundation

/// Used to define the type of an AndesBadge
@objc public enum AndesBadgeModifier: Int, AndesEnumStringConvertible {
    case pill
//    case dot
//    case notification
    public static func keyFor(_ value: AndesBadgeModifier) -> String {
        switch value {
        case .pill: return "PILL"
//        case .dot: return "DOT"
//        case .notification: return "NOTIFICATION"
        }
    }
}
