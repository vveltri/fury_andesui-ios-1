//
//  AndesTextFieldType.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

/// Used to define type of textfield
@objc public enum AndesTextFieldType: Int, LosslessStringConvertible {
    case simple
    case textArea

    internal static var keys: [String] {
        ["SIMPLE", "TEXT_AREA"]
    }

    public init?(_ description: String) {
        guard let rawValue = AndesTextFieldType.keys.firstIndex(of: description.uppercased()) else {
            return nil
        }
        self.init(rawValue: rawValue)
    }

    public var description: String {
        return AndesTextFieldType.keys[self.rawValue]
    }
}
