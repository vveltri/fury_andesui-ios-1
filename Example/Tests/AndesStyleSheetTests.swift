//
//  AndesStyleSheetTests.swift
//  AndesUI_Tests
//
//  Created by LEANDRO FURYK on 26/12/2019.
//  Copyright © 2019 MercadoLibre. All rights reserved.
//

import Quick
import Nimble
import AndesUI

class AndesStyleSheetTests: QuickSpec {
    override func spec() {
        describe("AndesStyleSheetManager should be able to be configured") {

            context("AndesStyleSheet has not been provided to Manager") {
                it("should use the default one") {
                    let styleSheetDefault = AndesStyleSheetDefault()
                    expect(self.compareStyleSheets(styleSheetOne: AndesStyleSheetManager.styleSheet, styleSheetTwo: styleSheetDefault)).to(beTrue())
                }
            }

            context("changing AndesStyleSheet") {
                it("should provide different colors") {
                    let firstStylesheet = AndesStyleSheetWhiteMock()
                    AndesStyleSheetManager.styleSheet = firstStylesheet

                    expect(self.compareStyleSheets(styleSheetOne: AndesStyleSheetManager.styleSheet, styleSheetTwo: firstStylesheet)).to(beTrue())

                    //Then change it
                    let secondStylesheet = AndesStyleSheetBlackMock()
                    AndesStyleSheetManager.styleSheet = secondStylesheet

                    expect(self.compareStyleSheets(styleSheetOne: AndesStyleSheetManager.styleSheet, styleSheetTwo: firstStylesheet)).to(beFalse())

                    expect(self.compareStyleSheets(styleSheetOne: AndesStyleSheetManager.styleSheet, styleSheetTwo: secondStylesheet)).to(beTrue())
                }
            }
        }
    }

    private func compareStyleSheets(styleSheetOne: AndesStyleSheet, styleSheetTwo: AndesStyleSheet) -> Bool {

        var equal = true

        equal = equal && styleSheetOne.brandColor.isEqual(styleSheetTwo.brandColor)

        equal = equal && styleSheetOne.accentPrimaryColor.isEqual(styleSheetTwo.accentPrimaryColor)
        equal = equal && styleSheetOne.accentSecondaryColor.isEqual(styleSheetTwo.accentSecondaryColor)
        equal = equal && styleSheetOne.accentTertiaryColor.isEqual(styleSheetTwo.accentTertiaryColor)

        equal = equal && styleSheetOne.backgroundPrimaryColor.isEqual(styleSheetTwo.backgroundPrimaryColor)
        equal = equal && styleSheetOne.backgroundSecondaryColor.isEqual(styleSheetTwo.backgroundSecondaryColor)
        equal = equal && styleSheetOne.backgroundWhiteColor.isEqual(styleSheetTwo.backgroundWhiteColor)

        equal = equal && styleSheetOne.textPrimaryColor.isEqual(styleSheetTwo.textPrimaryColor)
        equal = equal && styleSheetOne.textSecondaryColor.isEqual(styleSheetTwo.textSecondaryColor)
        equal = equal && styleSheetOne.textDisableColor.isEqual(styleSheetTwo.textDisableColor)
        equal = equal && styleSheetOne.textWhiteColor.isEqual(styleSheetTwo.textWhiteColor)
        equal = equal && styleSheetOne.textLinkColor.isEqual(styleSheetTwo.textLinkColor)

        equal = equal && styleSheetOne.errorPrimaryColor.isEqual(styleSheetTwo.errorPrimaryColor)
        equal = equal && styleSheetOne.errorSecondaryColor.isEqual(styleSheetTwo.errorSecondaryColor)

        equal = equal && styleSheetOne.warningPrimaryColor.isEqual(styleSheetTwo.warningPrimaryColor)
        equal = equal && styleSheetOne.warningSecondaryColor.isEqual(styleSheetTwo.warningSecondaryColor)

        equal = equal && styleSheetOne.successPrimaryColor.isEqual(styleSheetTwo.successPrimaryColor)
        equal = equal && styleSheetTwo.successSecondaryColor.isEqual(styleSheetTwo.successSecondaryColor)

        equal = equal && styleSheetOne.titleXL(color: styleSheetOne.textPrimaryColor).compare(object: (styleSheetTwo.titleXL(color: styleSheetTwo.textPrimaryColor)))
        equal = equal && styleSheetOne.titleL(color: styleSheetOne.textPrimaryColor).compare(object: (styleSheetTwo.titleL(color: styleSheetTwo.textPrimaryColor)))
        equal = equal && styleSheetOne.titleM(color: styleSheetOne.textPrimaryColor).compare(object: (styleSheetTwo.titleM(color: styleSheetTwo.textPrimaryColor)))
        equal = equal && styleSheetOne.titleS(color: styleSheetOne.textPrimaryColor).compare(object: (styleSheetTwo.titleS(color: styleSheetTwo.textPrimaryColor)))

        equal = equal && styleSheetOne.bodyXL(color: styleSheetOne.textPrimaryColor).compare(object: (styleSheetTwo.bodyXL(color: styleSheetTwo.textPrimaryColor)))
        equal = equal && styleSheetOne.bodyL(color: styleSheetOne.textPrimaryColor).compare(object: (styleSheetTwo.bodyL(color: styleSheetTwo.textPrimaryColor)))
        equal = equal && styleSheetOne.bodyM(color: styleSheetOne.textPrimaryColor).compare(object: (styleSheetTwo.bodyM(color: styleSheetTwo.textPrimaryColor)))

        equal = equal && styleSheetOne.linkL(color: styleSheetOne.textLinkColor).compare(object: (styleSheetTwo.linkL(color: styleSheetTwo.textLinkColor)))
        equal = equal && styleSheetOne.linkM(color: styleSheetOne.textLinkColor).compare(object: (styleSheetTwo.linkM(color: styleSheetTwo.textLinkColor)))
        
        equal = equal && styleSheetOne.regularSystemFont(size: 1).isEqual(styleSheetTwo.regularSystemFont(size: 1))
        equal = equal && styleSheetOne.lightSystemFont(size: 1).isEqual(styleSheetTwo.lightSystemFont(size: 1))
        equal = equal && styleSheetOne.mediumSystemFontOfSize(size: 1).isEqual(styleSheetTwo.mediumSystemFontOfSize(size: 1))
        equal = equal && styleSheetOne.semiboldSystemFontOfSize(size: 1).isEqual(styleSheetTwo.semiboldSystemFontOfSize(size: 1))

        return equal
    }
}

extension AndesFontStyle {
    public func compare(object: AndesFontStyle) -> Bool {
        var equal = self.textColor.isEqual(object.textColor)
        equal = equal && self.font.isEqual(object.font)
        return equal && self.lineHeight.isEqual(to: object.lineHeight)
    }
}

class AndesStyleSheetWhiteMock: AndesStyleSheet {

    var brandColor: UIColor = .white

    var accentPrimaryColor: UIColor = .white

    var accentSecondaryColor: UIColor = .white

    var accentTertiaryColor: UIColor = .white

    var backgroundPrimaryColor: UIColor = .white

    var backgroundSecondaryColor: UIColor = .white

    var backgroundWhiteColor: UIColor = .white

    var textPrimaryColor: UIColor = .white

    var textSecondaryColor: UIColor = .white

    var textDisableColor: UIColor = .white

    var textWhiteColor: UIColor = .white

    var textLinkColor: UIColor = .white

    var errorPrimaryColor: UIColor = .white

    var errorSecondaryColor: UIColor = .white

    var warningPrimaryColor: UIColor = .white

    var warningSecondaryColor: UIColor = .white

    var successPrimaryColor: UIColor = .white

    var successSecondaryColor: UIColor = .white

    var mockAndesFontStyle: AndesFontStyle = AndesFontStyle(textColor: .white, font: UIFont.boldSystemFont(ofSize: 1), lineHeight: 1)

    func titleXL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func titleL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func titleM(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func titleS(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func bodyXL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func bodyL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func bodyM(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func linkL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func linkM(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
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
}

class AndesStyleSheetBlackMock: AndesStyleSheet {

    var brandColor: UIColor = .black

    var accentPrimaryColor: UIColor = .black

    var accentSecondaryColor: UIColor = .black

    var accentTertiaryColor: UIColor = .black

    var backgroundPrimaryColor: UIColor = .black

    var backgroundSecondaryColor: UIColor = .black

    var backgroundWhiteColor: UIColor = .black

    var textPrimaryColor: UIColor = .black

    var textSecondaryColor: UIColor = .black

    var textDisableColor: UIColor = .black

    var textWhiteColor: UIColor = .black

    var textLinkColor: UIColor = .black

    var errorPrimaryColor: UIColor = .black

    var errorSecondaryColor: UIColor = .black

    var warningPrimaryColor: UIColor = .black

    var warningSecondaryColor: UIColor = .black

    var successPrimaryColor: UIColor = .black

    var successSecondaryColor: UIColor = .black

    var mockAndesFontStyle: AndesFontStyle = AndesFontStyle(textColor: .black, font: UIFont.boldSystemFont(ofSize: 2), lineHeight: 2)

    func titleXL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func titleL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func titleM(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func titleS(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func bodyXL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func bodyL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func bodyM(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func linkL(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
    }

    func linkM(color: UIColor) -> AndesFontStyle {
        return mockAndesFontStyle
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
}
