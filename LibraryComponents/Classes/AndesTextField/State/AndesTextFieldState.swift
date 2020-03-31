//
//  AndesTextFieldState.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

/// Used to define the colors of an AndesTextField
@objc public enum AndesTextFieldState: Int, AndesEnumStringConvertible {
    case idle
    case error
    case disabled
    case readOnly

    internal static var keys: [String] {
        ["IDLE", "ERROR", "DISABLED", "READONLY"]
      }

}
