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

    internal static var keys: [String] {
        ["SIMPLE", "TEXT_AREA"]
    }
}
