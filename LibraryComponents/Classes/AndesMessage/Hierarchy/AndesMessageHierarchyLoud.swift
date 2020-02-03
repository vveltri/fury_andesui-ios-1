//
//  AndesMessageHierarchyLoud.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
struct AndesMessageHierarchyLoud: AndesMessageHierarchyProtocol {
    var primaryButtonHierarchy: AndesButtonHierarchyProtocol

    var secondaryButtonHierarchy: AndesButtonHierarchyProtocol

    var dismissButtonColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor

    var textColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor

    var backgroundColor: UIColor

    var pipeColor: UIColor

    var accentColor: UIColor

    init(type: AndesMessageTypeProtocol) {
        backgroundColor = type.primaryColor
        pipeColor = type.primaryColor
        accentColor = type.secondaryColor
        primaryButtonHierarchy = PrimaryMessageActionButtonHierarchy(backgroundColor: type.secondaryColor)
        secondaryButtonHierarchy = SecondaryMessageActionButtonHierarchy(textColor: textColor, pressedColor: type.secondaryColor)
    }
}
