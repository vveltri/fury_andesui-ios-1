//
//  AndesDropdownMenuType.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 27/11/20.
//

import Foundation

@objc public enum AndesDropdownMenuType: Int, AndesEnumStringConvertible {
    case botttomSheet
    case floatingMenu

    public static func keyFor(_ value: AndesDropdownMenuType) -> String {
        switch value {
        case .botttomSheet: return "BOTTOMSHEET"
        case .floatingMenu: return "FLOATINGMENU"
        }
    }
}
