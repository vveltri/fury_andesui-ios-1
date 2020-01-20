//
//  AndesStyleSheetDefault.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 04/12/2019.
//

import Foundation

@objc public class AndesStyleSheetDefault: NSObject, AndesStyleSheet {

    private let titleXLSize: CGFloat = 32
    private let titleLSize: CGFloat = 28
    private let titleMSize: CGFloat = 24
    private let titleSSize: CGFloat = 20

    private let defaultXLSize: CGFloat = 18
    private let defaultLSize: CGFloat = 16
    private let defaultMSize: CGFloat = 14

    public lazy var brandColor: UIColor = self.stylesheetStrategy.brandColor

    public lazy var accentPrimaryColor: UIColor = self.stylesheetStrategy.accentPrimaryColor
    public lazy var accentSecondaryColor: UIColor = self.stylesheetStrategy.accentSecondaryColor
    public lazy var accentTertiaryColor: UIColor = self.stylesheetStrategy.accentTertiaryColor

    public lazy var backgroundPrimaryColor: UIColor = self.stylesheetStrategy.backgroundPrimaryColor
    public lazy var backgroundSecondaryColor: UIColor = self.stylesheetStrategy.backgroundSecondaryColor
    public lazy var backgroundWhiteColor: UIColor = self.stylesheetStrategy.backgroundWhiteColor

    public lazy var textPrimaryColor: UIColor = self.stylesheetStrategy.textPrimaryColor
    public lazy var textSecondaryColor: UIColor = self.stylesheetStrategy.textSecondaryColor
    public lazy var textDisableColor: UIColor = self.stylesheetStrategy.textDisableColor
    public lazy var textWhiteColor: UIColor = self.stylesheetStrategy.textWhiteColor
    public lazy var textLinkColor: UIColor = self.stylesheetStrategy.textLinkColor

    public lazy var errorPrimaryColor: UIColor = self.stylesheetStrategy.errorPrimaryColor
    public lazy var errorSecondaryColor: UIColor = self.stylesheetStrategy.errorSecondaryColor

    public lazy var warningPrimaryColor: UIColor = self.stylesheetStrategy.warningPrimaryColor
    public lazy var warningSecondaryColor: UIColor = self.stylesheetStrategy.warningSecondaryColor

    public lazy var successPrimaryColor: UIColor = self.stylesheetStrategy.successPrimaryColor
    public lazy var successSecondaryColor: UIColor = self.stylesheetStrategy.successSecondaryColor

    private var stylesheetStrategy: AndesColors

    public override init() {
        //TODO: Remove when iOS 11 is minimum deployment target
        if #available(iOS 11.0, *) {
            self.stylesheetStrategy = AndesColorStrategyiOS11()
        } else {
            self.stylesheetStrategy = AndesColorStrategyiOS10()
        }
    }

    public func titleXL(color: UIColor) -> AndesFontStyle {
        self.validateColorForTitle(color: color)
        return AndesFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: self.titleXLSize), lineHeight: 1.25)
    }

    public func titleL(color: UIColor) -> AndesFontStyle {
        self.validateColorForTitle(color: color)
        return AndesFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: self.titleLSize), lineHeight: 1.25)
    }

    public func titleM(color: UIColor) -> AndesFontStyle {
        self.validateColorForTitle(color: color)
        return AndesFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: self.titleMSize), lineHeight: 1.25)
    }

    public func titleS(color: UIColor) -> AndesFontStyle {
        self.validateColorForTitle(color: color)
        return AndesFontStyle(textColor: color, font: semiboldSystemFontOfSize(size: self.titleSSize), lineHeight: 1.25)
    }

    public func bodyXL(color: UIColor) -> AndesFontStyle {
        self.validateColorForBody(color: color)
        return AndesFontStyle(textColor: color, font: regularSystemFont(size: self.defaultXLSize), lineHeight: 1.25)
    }

    public func bodyL(color: UIColor) -> AndesFontStyle {
        self.validateColorForBody(color: color)
        return AndesFontStyle(textColor: color, font: regularSystemFont(size: self.defaultLSize), lineHeight: 1.25)
    }

    public func bodyM(color: UIColor) -> AndesFontStyle {
        self.validateColorForBody(color: color)
        return AndesFontStyle(textColor: color, font: regularSystemFont(size: self.defaultMSize), lineHeight: 1.25)
    }

    public func linkL(color: UIColor) -> AndesFontStyle {
        self.validateColorForLink(color: color)
        return AndesFontStyle(textColor: color, font: mediumSystemFontOfSize(size: self.defaultLSize), lineHeight: 1.0)
    }

    public func linkM(color: UIColor) -> AndesFontStyle {
        self.validateColorForLink(color: color)
        return AndesFontStyle(textColor: color, font: mediumSystemFontOfSize(size: self.defaultMSize), lineHeight: 1.0)
    }

    public func regularSystemFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    public func lightSystemFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    public func mediumSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    public func semiboldSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }

    private func validateColorForTitle(color: UIColor) {
        if(!color.isEqual(self.stylesheetStrategy.textWhiteColor) && !color.isEqual(self.stylesheetStrategy.textPrimaryColor)) {
            fatalError("You must use an allowed color. Please check Andes documentation")
        }
    }

    private func validateColorForBody(color: UIColor) {
        if(!color.isEqual(self.stylesheetStrategy.textPrimaryColor) && !color.isEqual(self.stylesheetStrategy.textSecondaryColor) && !color.isEqual(self.stylesheetStrategy.textDisableColor)) {
            fatalError("You must use an allowed color. Please check Andes documentation")
        }
    }

    private func validateColorForLink(color: UIColor) {
        if(!color.isEqual(self.stylesheetStrategy.textLinkColor)) {
            fatalError("You must use an allowed color. Please check Andes documentation")
        }
    }
}
