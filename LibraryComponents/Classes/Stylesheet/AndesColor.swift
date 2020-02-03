//
//  AndesColor.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation

//TODO: Remove when iOS 11 is minimum deployment target
@objc extension UIColor {

    public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

    @objc public class AndesColor: NSObject {

        @objc public class Blue: NSObject {
            @objc public static let one = UIColor(red: 52, green: 131, blue: 250)
            @objc public static let two = UIColor(red: 41, green: 104, blue: 200)
            @objc public static let three = UIColor(red: 31, green: 78, blue: 150)
            @objc public static let four = UIColor(red: 0, green: 158, blue: 227)
            @objc public static let five = UIColor(red: 0, green: 126, blue: 181)
            @objc public static let six = UIColor(red: 0, green: 94, blue: 136)
        }

        @objc public class Background: NSObject {
            @objc public static let primary = UIColor(red: 237, green: 237, blue: 237)
            @objc public static let secundary = UIColor(red: 245, green: 245, blue: 245)
        }

        @objc public class White: NSObject {
            @objc public static let one = UIColor(red: 255, green: 255, blue: 255)
        }

        @objc public class Gray: NSObject {
            @objc public static let gray800 = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
            @objc public static let gray450 = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
            @objc public static let gray250 = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
            @objc public static let gray100 = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
            @objc public static let gray70 = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07)
            @objc public static let gray40 = UIColor(red: 0, green: 0, blue: 0, alpha: 0.04)
        }

        @objc public class Red: NSObject {
            @objc public static let light = UIColor(red: 242, green: 61, blue: 79)
            @objc public static let dark = UIColor(red: 209, green: 36, blue: 64)
        }

        @objc public class Orange: NSObject {
            @objc public static let light = UIColor(red: 255, green: 119, blue: 51)
            @objc public static let dark = UIColor(red: 230, green: 84, blue: 11)
        }

        @objc public class Green: NSObject {
            @objc public static let light = UIColor(red: 0, green: 166, blue: 80)
            @objc public static let dark = UIColor(red: 0, green: 135, blue: 68)
        }

        @objc public class Yellow: NSObject {
            @objc public static let primary = UIColor(red: 255, green: 230, blue: 0)
        }
    }
}

internal extension UIColor {
    /// blends self with a black mask and alpha equivalent
    /// - Parameter percent: alpha of the black mask to blend with self in %
    func darken(by percent: Int) -> UIColor {
        assert((percent >= 0 && percent <= 100), "by must be between 0 and 100")
        var bgR: CGFloat = 0
        var bgG: CGFloat = 0
        var bgB: CGFloat = 0
        var bgA: CGFloat = 0

        let maskAlpha: CGFloat = CGFloat(percent) /  100.0

        self.getRed(&bgR, green: &bgG, blue: &bgB, alpha: &bgA)

        let red = (1 - maskAlpha) * bgR
        let green = (1 - maskAlpha) * bgG
        let blue = (1 - maskAlpha) * bgB

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
