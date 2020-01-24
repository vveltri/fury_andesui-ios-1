//
//  AndesMessageHierarchyQuiet.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/21/20.
//

import Foundation
struct AndesMessageHierarchyQuiet: AndesMessageHierarchyProtocol {
    var dismissButtonColor: UIColor = AndesStyleSheetManager.styleSheet.textPrimaryColor

    var textColor: UIColor = AndesStyleSheetManager.styleSheet.textPrimaryColor

    var backgroundColor: UIColor = AndesStyleSheetManager.styleSheet.backgroundPrimaryColor

    var pipeColor: UIColor

    var accentColor: UIColor

    init(type: AndesMessageTypeProtocol) {
        pipeColor = type.primaryColor
        accentColor = type.primaryColor
    }
}
