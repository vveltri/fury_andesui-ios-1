//
//  AndesSnackbarViewConfig.swift
//  AndesUI
//
//  Created by Samuel Sainz on 6/15/20.
//

import Foundation

internal struct AndesSnackbarViewConfig {

    var text: String = ""
    var backgroundColor: UIColor = UIColor.Andes.graySolid800
    var actionConfig: AndesButtonViewConfig?

    init() {}

    init(text: String, backgroundColor: UIColor, actionConfig: AndesButtonViewConfig? = nil) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.actionConfig = actionConfig
    }
}
