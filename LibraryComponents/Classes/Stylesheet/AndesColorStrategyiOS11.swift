//
//  AndesColorStrategyiOS11.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation

@available(iOS 11.0, *)
public class AndesColorStrategyiOS11: AndesColors {

    public var brandColor: UIColor = UIColor(named: "Brand", in: AndesBundle.bundle(), compatibleWith: nil)!

    public var accentPrimaryColor: UIColor = UIColor(named: "AccentPrimary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var accentSecondaryColor: UIColor = UIColor(named: "AccentSecondary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var accentTertiaryColor: UIColor = UIColor(named: "AccentTertiary", in: AndesBundle.bundle(), compatibleWith: nil)!

    public var backgroundPrimaryColor: UIColor = UIColor(named: "BackgroundPrimary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var backgroundSecondaryColor: UIColor = UIColor(named: "BackgroundSecondary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var backgroundWhiteColor: UIColor = UIColor(named: "BackgroundWhite", in: AndesBundle.bundle(), compatibleWith: nil)!

    public var textPrimaryColor: UIColor = UIColor(named: "TextPrimary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var textSecondaryColor: UIColor = UIColor(named: "TextSecondary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var textDisableColor: UIColor = UIColor(named: "TextDisable", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var textWhiteColor: UIColor = UIColor(named: "TextWhite", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var textLinkColor: UIColor = UIColor(named: "Link", in: AndesBundle.bundle(), compatibleWith: nil)!

    public var errorPrimaryColor: UIColor = UIColor(named: "ErrorPrimary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var errorSecondaryColor: UIColor = UIColor(named: "ErrorSecondary", in: AndesBundle.bundle(), compatibleWith: nil)!

    public var warningPrimaryColor: UIColor = UIColor(named: "WarningPrimary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var warningSecondaryColor: UIColor = UIColor(named: "WarningSecondary", in: AndesBundle.bundle(), compatibleWith: nil)!

    public var successPrimaryColor: UIColor = UIColor(named: "SuccessPrimary", in: AndesBundle.bundle(), compatibleWith: nil)!
    public var successSecondaryColor: UIColor = UIColor(named: "SuccessSecondary", in: AndesBundle.bundle(), compatibleWith: nil)!
}
