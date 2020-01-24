//
//  AndesMessageTypeError.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeError: AndesMessageTypeProtocol {
    var primaryColor: UIColor = AndesStyleSheetManager.styleSheet.errorPrimaryColor
    var secondaryColor: UIColor = AndesStyleSheetManager.styleSheet.errorSecondaryColor
    var icon: UIImage = UIImage(named: "andes_ui_feedback_error_16", in: AndesBundle.bundle(), compatibleWith: nil)!
}
