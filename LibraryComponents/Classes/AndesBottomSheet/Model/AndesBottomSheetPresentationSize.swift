//
//  AndesBottomSheetPresentationSize.swift
//  AndesUI
//
//  Created by INAKI YABAR BILBAO on 29/12/2020.
//

import Foundation
@objc public enum AndesBottomSheetPresentationSize: Int, AndesEnumStringConvertible {
    case fixed
    case intrinsic

    public static func keyFor(_ value: AndesBottomSheetPresentationSize) -> String {
        switch value {
            case .fixed: return "fixed"
            case .intrinsic: return "intrinsic"
        }
    }
}
