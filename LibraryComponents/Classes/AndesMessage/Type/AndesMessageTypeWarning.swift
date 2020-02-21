//
//  AndesMessageTypeWarning.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeWarning: AndesMessageTypeProtocol {
    var primaryColor: UIColor = AndesStyleSheetManager.styleSheet.warningPrimaryColor
    var secondaryColor: UIColor = AndesStyleSheetManager.styleSheet.warningSecondaryColor
    var icon: String = AndesIcons.feedbackWarning16
}
