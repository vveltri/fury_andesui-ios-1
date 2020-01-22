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
    var icon: UIImage = AndesMessageViewConfig.getIcon()
}
