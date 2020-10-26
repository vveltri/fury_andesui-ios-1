//
//  AndesSeparatorStyleListView.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 26/10/20.
//

import Foundation

@objc public enum AndesSeparatorStyleListView: Int, AndesEnumStringConvertible {
    case none
    case singleLine

    public static func keyFor(_ value: AndesSeparatorStyleListView) -> String {
        switch value {
        case .none: return "NONE"
        case .singleLine: return "SINGLE_LINE"
        }
    }
}
