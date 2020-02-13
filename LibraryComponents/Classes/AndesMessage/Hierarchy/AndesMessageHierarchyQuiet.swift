//
//  AndesMessageHierarchyQuiet.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
struct AndesMessageHierarchyQuiet: AndesMessageHierarchyProtocol {
    var primaryButtonHierarchy: AndesButtonHierarchyProtocol = AndesButtonHierarchyLoud()

    var secondaryButtonHierarchy: AndesButtonHierarchyProtocol = AndesButtonHierarchyTransparent()

    var dismissButtonColor: UIColor = AndesStyleSheetManager.styleSheet.textPrimaryColor

    var textColor: UIColor = AndesStyleSheetManager.styleSheet.textPrimaryColor

    var backgroundColor: UIColor = UIColor.AndesColor.Gray.gray40

    var pipeColor: UIColor

    var accentColor: UIColor

    init(type: AndesMessageTypeProtocol) {
        pipeColor = type.primaryColor
        accentColor = type.primaryColor
        primaryButtonHierarchy = AndesButtonHierarchyLoud()
        secondaryButtonHierarchy = AndesButtonHierarchyTransparent()
    }
}
