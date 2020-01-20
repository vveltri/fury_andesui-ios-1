//
//  AndesStyleSheet.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 04/12/2019.
//

import Foundation

@objc public protocol AndesStyleSheet: AndesColors, AndesFonts {}

/**
  AndesColors is used to create a new StyleSheet
  implementing all the necessary colors
*/
@objc public protocol AndesColors {

    /**
      The default colors that you need to override
      to use your color palette through all the UI components
    */
    var brandColor: UIColor { get }

    var accentPrimaryColor: UIColor { get }
    var accentSecondaryColor: UIColor { get }
    var accentTertiaryColor: UIColor { get }

    var backgroundPrimaryColor: UIColor { get }
    var backgroundSecondaryColor: UIColor { get }
    var backgroundWhiteColor: UIColor { get }

    var textPrimaryColor: UIColor { get }
    var textSecondaryColor: UIColor { get }
    var textDisableColor: UIColor { get }
    var textWhiteColor: UIColor { get }
    var textLinkColor: UIColor { get }

    var errorPrimaryColor: UIColor { get }
    var errorSecondaryColor: UIColor { get }

    var warningPrimaryColor: UIColor { get }
    var warningSecondaryColor: UIColor { get }

    var successPrimaryColor: UIColor { get }
    var successSecondaryColor: UIColor { get }
}

/**
  AndesFonts is used to create a new StyleSheet
  implementing all the necessary fonts
*/
@objc public protocol AndesFonts {

    /**
      The default font variations that you need to override
      to use your own font through all the UI components.
      By default these methods return the SF system font
    */
    func titleXL(color: UIColor) -> AndesFontStyle
    func titleL(color: UIColor) -> AndesFontStyle
    func titleM(color: UIColor) -> AndesFontStyle
    func titleS(color: UIColor) -> AndesFontStyle

    func bodyXL(color: UIColor) -> AndesFontStyle
    func bodyL(color: UIColor) -> AndesFontStyle
    func bodyM(color: UIColor) -> AndesFontStyle

    func linkL(color: UIColor) -> AndesFontStyle
    func linkM(color: UIColor) -> AndesFontStyle

    func regularSystemFont(size: CGFloat) -> UIFont
    func lightSystemFont(size: CGFloat) -> UIFont
    func mediumSystemFontOfSize(size: CGFloat) -> UIFont
    func semiboldSystemFontOfSize(size: CGFloat) -> UIFont
}
