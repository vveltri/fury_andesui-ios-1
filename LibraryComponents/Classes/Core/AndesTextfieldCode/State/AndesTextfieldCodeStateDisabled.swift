//
//  AndesTextfieldCodeStateDisabled.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 22/09/2020.
//

import Foundation

struct AndesTextfieldCodeStateDisabled: AndesTextfieldCodeStateProtocol {
    var labelTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var helperTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var helperSemibold: Bool = false
}
