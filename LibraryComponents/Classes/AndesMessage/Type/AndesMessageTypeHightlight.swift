//
//  AndesMessageTypeHightlight.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeHightlight: AndesMessageTypeProtocol {
    var primaryColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor
    var secondaryColor: UIColor = AndesStyleSheetManager.styleSheet.accentSecondaryColor
    var icon: UIImage = UIImage(named: "andes_ui_feedback_info_16", in: AndesBundle.bundle(), compatibleWith: nil)!
}
