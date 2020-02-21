//
//  AndesColor.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 05/12/2019.
//

import Foundation

@objc public extension UIColor {
    /// Andes Color Palette
    struct Andes {
        static let white = UIColor(hex: "#FFFFFF")!

        static let gray040 = UIColor(hex: "#0A000000")!
        static let gray070 = UIColor(hex: "#12000000")!
        static let gray100 = UIColor(hex: "#1A000000")!
        static let gray250 = UIColor(hex: "#40000000")!
        static let gray450 = UIColor(hex: "#73000000")!
        static let gray800 = UIColor(hex: "#CC000000")!

        static let graySolid040 = UIColor(hex: "#F5F5F5")!
        static let graySolid070 = UIColor(hex: "#EDEDED")!
        static let graySolid100 = UIColor(hex: "#E5E5E5")!
        static let graySolid250 = UIColor(hex: "#B5B5B5")!
        static let graySolid450 = UIColor(hex: "#8C8C8C")!
        static let graySolid800 = UIColor(hex: "#333333")!

        static let yellowML500 = UIColor(hex: "#FFE602")!

        static let blueML100 = UIColor(hex: "#1A4189E6")!
        static let blueML150 = UIColor(hex: "#264189E6")!
        static let blueML200 = UIColor(hex: "#334189E6")!
        static let blueML300 = UIColor(hex: "#4D4189E6")!
        static let blueML400 = UIColor(hex: "#664189E6")!
        static let blueML500 = UIColor(hex: "#3483FA")!
        static let blueML600 = UIColor(hex: "#2968C8")!
        static let blueML700 = UIColor(hex: "#1F4E96")!
        static let blueML800 = UIColor(hex: "#183C73")!

        static let blueMP100 = UIColor(hex: "#1A479AD1")!
        static let blueMP150 = UIColor(hex: "#26479AD1")!
        static let blueMP200 = UIColor(hex: "#33479AD1")!
        static let blueMP300 = UIColor(hex: "#4D479AD1")!
        static let blueMP400 = UIColor(hex: "#66479AD1")!
        static let blueMP500 = UIColor(hex: "#3483FA")!
        static let blueMP600 = UIColor(hex: "#2968C8")!
        static let blueMP700 = UIColor(hex: "#1F4E96")!
        static let blueMP800 = UIColor(hex: "#004766")!

        static let green100 = UIColor(hex: "#1A00A650")!
        static let green150 = UIColor(hex: "#2600A650")!
        static let green200 = UIColor(hex: "#3300A650")!
        static let green300 = UIColor(hex: "#4D00A650")!
        static let green400 = UIColor(hex: "#6600A650")!
        static let green500 = UIColor(hex: "#00A650")!
        static let green600 = UIColor(hex: "#008744")!
        static let green700 = UIColor(hex: "#006633")!
        static let green800 = UIColor(hex: "#004D27")!

        static let orange100 = UIColor(hex: "#1AFF7733")!
        static let orange150 = UIColor(hex: "#26FF7733")!
        static let orange200 = UIColor(hex: "#33FF7733")!
        static let orange300 = UIColor(hex: "#4DFF7733")!
        static let orange400 = UIColor(hex: "#66FF7733")!
        static let orange500 = UIColor(hex: "#FF7733")!
        static let orange600 = UIColor(hex: "#E6540B")!
        static let orange700 = UIColor(hex: "#CC3E0A")!
        static let orange800 = UIColor(hex: "#A62A08")!

        static let red100 = UIColor(hex: "#1AF23D4F")!
        static let red150 = UIColor(hex: "#26F23D4F")!
        static let red200 = UIColor(hex: "#33F23D4F")!
        static let red300 = UIColor(hex: "#4DF23D4F")!
        static let red400 = UIColor(hex: "#66F23D4F")!
        static let red500 = UIColor(hex: "#F23D4F")!
        static let red600 = UIColor(hex: "#D12440")!
        static let red700 = UIColor(hex: "#A61D33")!
        static let red800 = UIColor(hex: "#801627")!
    }
}

internal extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }

    /// init UIColor with hex code
    /// - Parameter hex: color representation, e.g: "#FFFFFF" or with alpha "#FF000000"
    convenience init?(hex: String) {
        var cString: String = hex.uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        var rgbValue: UInt64 = 0
        guard (cString.count == 6 || cString.count == 8) &&
            Scanner(string: cString).scanHexInt64(&rgbValue) else {
            return nil
        }
        if cString.count == 6 {
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        } else {
            self.init(
                red: CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x000000FF) / 255.0,
                alpha: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            )
        }
    }
}
