//
//  AndesButtonQuiet.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
//

import Foundation

internal struct AndesButtonHierarchyQuiet: AndesButtonHierarchyProtocol {

    public var idleColor: UIColor = UIColor(red: 0.254, green: 0.537, blue: 0.901, alpha: 0.15)

    public var pressedColor: UIColor = UIColor(red: 0.254, green: 0.537, blue: 0.901, alpha: 0.3)

    public var focusColor: UIColor = UIColor(red: 0.254, green: 0.537, blue: 0.901, alpha: 0.15)

    public var disableColor: UIColor = UIColor.AndesColor.Gray.gray100

    public var fontColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor
}
