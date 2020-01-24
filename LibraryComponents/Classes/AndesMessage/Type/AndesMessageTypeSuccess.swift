//
//  AndesMessageTypeSuccess.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
class AndesMessageTypeSuccess: AndesMessageTypeProtocol {
    var primaryColor: UIColor = AndesStyleSheetManager.styleSheet.successPrimaryColor
    var secondaryColor: UIColor = AndesStyleSheetManager.styleSheet.successSecondaryColor
    var icon: UIImage = UIImage(named: "andes_ui_feedback_success_16", in: AndesBundle.bundle(), compatibleWith: nil)!
}
