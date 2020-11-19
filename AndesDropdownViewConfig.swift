//
//  AndesDropdownViewConfig.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

internal struct AndesDropdownViewConfig {
    var borderColor: UIColor
    var labelText: String?
    var helperText: String?
    var counter: UInt16
    var placeholderText: String?

    init(borderColor: UIColor, labelText: String?, helperText: String?, counter: UInt16, placeholderText: String?) {
        self.borderColor = borderColor
        self.labelText = labelText
        self.helperText = helperText
        self.counter = counter
        self.placeholderText = placeholderText
    }
}
