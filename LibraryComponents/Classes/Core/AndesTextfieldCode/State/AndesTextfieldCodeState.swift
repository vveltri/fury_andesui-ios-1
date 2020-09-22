//
//  AndesTextfieldCodeState.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

@objc public enum AndesTextfieldCodeState: Int, AndesEnumStringConvertible {

    case idle
    case error
    case disabled

    public static func keyFor(_ value: AndesTextfieldCodeState) -> String {
        switch value {
        case .idle:
            return "IDLE"
        case .error:
            return "ERROR"
        case .disabled:
            return "DISABLED"
        }
    }
}
