//
//  AndesTextfieldCodeStyle.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

@objc public enum AndesTextfieldCodeStyle: Int, AndesEnumStringConvertible {

    case threesome
    case foursome
    case threeByThree

    public static func keyFor(_ value: AndesTextfieldCodeStyle) -> String {
        switch value {
        case .threesome:
            return "THREESOME"
        case .foursome:
            return "FOURSOME"
        case .threeByThree:
            return "THREE_BY_THREE"
        }
    }
}
