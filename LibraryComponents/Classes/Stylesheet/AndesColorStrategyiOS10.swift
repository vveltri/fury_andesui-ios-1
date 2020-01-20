//
//  AndesColorStrategyiOS10.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation

//TODO: Remove when iOS 11 is minimum deployment target
public class AndesColorStrategyiOS10: AndesColors {

    public var brandColor: UIColor = UIColor.AndesColor.Blue.four

    public var accentPrimaryColor: UIColor = UIColor.AndesColor.Blue.four
    public var accentSecondaryColor: UIColor = UIColor.AndesColor.Blue.five
    public var accentTertiaryColor: UIColor = UIColor.AndesColor.Blue.six

    public var backgroundPrimaryColor: UIColor = UIColor.AndesColor.Background.primary
    public var backgroundSecondaryColor: UIColor = UIColor.AndesColor.Background.secundary
    public var backgroundWhiteColor: UIColor = UIColor.AndesColor.White.one

    public var textPrimaryColor: UIColor = UIColor.AndesColor.Gray.gray800
    public var textSecondaryColor: UIColor = UIColor.AndesColor.Gray.gray450
    public var textDisableColor: UIColor = UIColor.AndesColor.Gray.gray250
    public var textWhiteColor: UIColor = UIColor.AndesColor.White.one
    public var textLinkColor: UIColor = UIColor.AndesColor.Blue.four

    public var errorPrimaryColor: UIColor = UIColor.AndesColor.Red.light
    public var errorSecondaryColor: UIColor = UIColor.AndesColor.Red.dark

    public var warningPrimaryColor: UIColor = UIColor.AndesColor.Orange.light
    public var warningSecondaryColor: UIColor = UIColor.AndesColor.Orange.dark

    public var successPrimaryColor: UIColor = UIColor.AndesColor.Green.light
    public var successSecondaryColor: UIColor = UIColor.AndesColor.Green.dark
}
