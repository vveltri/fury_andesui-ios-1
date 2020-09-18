//
//  AndesTextFieldCodeViewConfig.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

struct AndesTextFieldCodeViewConfig {

    var label: String?
    var helpLabel: String?
    var style: String

    init(label: String?, helpLabel: String?, style: String) {
        self.label = label
        self.helpLabel = helpLabel
        self.style = style
    }
}
