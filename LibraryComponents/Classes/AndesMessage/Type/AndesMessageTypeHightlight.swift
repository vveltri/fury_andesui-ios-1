//
//  AndesMessageTypeHightlight.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeHightlight: AndesMessageTypeProtocol {
    var primaryColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor
    var secondaryColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor600
    var primaryButtonPressedColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor800
    var secondaryButtonPressedColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor700
    var icon: String = AndesIcons.feedbackInfo16
}
