//
//  AndesFontStyle.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation

@objc public class AndesFontStyle: NSObject {
    @objc public private(set) var textColor: UIColor
    @objc public private(set) var font: UIFont
    @objc public private(set) var lineHeight: CGFloat

    @objc public init(textColor: UIColor, font: UIFont, lineHeight: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineHeight = lineHeight
    }
}
