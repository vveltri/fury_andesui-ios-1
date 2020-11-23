//
//  AndesDropdownViewConfig.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

internal struct AndesDropdownViewConfig {
    var borderColor: UIColor
    var counter: UInt16
    var placeholderText: String?
    var icon: String?
    var title: String?

    init(borderColor: UIColor,
         counter: UInt16,
         placeholderText: String?,
         icon: String?,
         title: String?) {
        self.borderColor = borderColor
        self.counter = counter
        self.placeholderText = placeholderText
        self.icon = icon
        self.title = title
    }
}
