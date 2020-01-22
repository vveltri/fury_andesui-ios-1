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
    var icon: UIImage = AndesMessageViewConfig.getIcon()
}
