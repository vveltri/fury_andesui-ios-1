//
//  PrimaryButtonHierarchy.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/31/20.
//

import Foundation

struct PrimaryMessageActionButtonHierarchy: AndesButtonHierarchyProtocol {
    var idleColor: UIColor

    var pressedColor: UIColor

    var disableColor: UIColor  = UIColor.AndesColor.Gray.gray100

    var fontColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor

    init(backgroundColor: UIColor) {
        self.idleColor = backgroundColor
        self.pressedColor = backgroundColor.darken(by: 55)
    }
}
