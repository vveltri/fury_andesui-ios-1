//
//  TypesCell.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 20/10/20.
//

import Foundation

public enum AndesCellType: Int, AndesEnumStringConvertible {
    case andesDefault
    case andesLeft

    public static func keyFor(_ value: AndesCellType) -> String {
        switch value {
        case .andesDefault: return "DEFAULT"
        case .andesLeft: return "LEFT"
        }
    }
}
