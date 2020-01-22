//
//  AndesButtonTransparent.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
//

import Foundation

internal struct AndesButtonHierarchyTransparent: AndesButtonHierarchyProtocol {

    public var idleColor: UIColor = .clear

    public var pressedColor: UIColor = UIColor(red: 0.278, green: 0.603, blue: 0.819, alpha: 0.2)

    public var focusColor: UIColor = .clear

    public var disableColor: UIColor = .clear

    public var fontColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor
}
