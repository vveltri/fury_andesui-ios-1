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

    /// Init an AndesFontStyle with a sketch line height
    /// - Parameters:
    ///   - textColor: Font Color
    ///   - font: font (with sketch size)
    ///   - sketchLineHeight: line height
    @objc public init(textColor: UIColor, font: UIFont, sketchLineHeight: CGFloat) {
        self.textColor = textColor
        self.font = font
        self.lineHeight = sketchLineHeight - font.lineHeight
    }
}

@objc public class AndesFontSize: NSObject {
    @objc public static let titleXL: CGFloat = 32
    @objc public static let titleL: CGFloat = 28
    @objc public static let titleM: CGFloat = 24
    @objc public static let titleS: CGFloat = 20
    @objc public static let titleXS: CGFloat = 18

    @objc public static let bodyL: CGFloat = 18
    @objc public static let bodyM: CGFloat = 16
    @objc public static let bodyS: CGFloat = 14
    @objc public static let bodyXS: CGFloat = 12
}
