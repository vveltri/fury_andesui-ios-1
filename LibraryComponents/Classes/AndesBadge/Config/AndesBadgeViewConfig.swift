//
//  AndesBadgeViewConfig.swift
//  AndesUI
//

import Foundation

/// used to define the ui of internal AndesBadge views
internal struct AndesBadgeViewConfig {
    var backgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor

    var cornerRadius: CGFloat = 6.0
    var height: CGFloat?
    var verticalPadding: CGFloat?
    var horizontalPadding: CGFloat?

    var text: String? = "Label"
    var textStyle: AndesFontStyle?

    var icon: String?
    var iconColor: UIColor?
    var iconBackgroundColor: UIColor?

    var roundedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

    init() {

    }

    init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor

        let sizeStyle = AndesBadgeSizeFactory.provide(.small)
        self.cornerRadius = sizeStyle.borderRadius
        self.height = sizeStyle.height
        self.verticalPadding = sizeStyle.verticalPadding
        self.horizontalPadding = sizeStyle.horizontalPadding

        textStyle = AndesBadgeViewConfig.getTextStyle(font: sizeStyle.font, color: AndesStyleSheetManager.styleSheet.textColorWhite, lineSpacing: sizeStyle.lineSpacing)
    }

    init(backgroundColor: UIColor, size: AndesBadgeSize, icon: String, iconBackgroundColor: UIColor) {
        self.backgroundColor = backgroundColor

        let sizeStyle = AndesBadgeSizeFactory.provide(size)
        self.cornerRadius = sizeStyle.borderRadius
        self.height = sizeStyle.height
        self.verticalPadding = sizeStyle.verticalPadding
        self.horizontalPadding = sizeStyle.horizontalPadding

        self.icon = icon
        self.iconBackgroundColor = iconBackgroundColor
    }

    init(backgroundColor: UIColor, text: String, size: AndesBadgeSize, textColor: UIColor, border: AndesBadgeBorder) {
        self.backgroundColor = backgroundColor

        let sizeStyle = AndesBadgeSizeFactory.provide(size)
        self.cornerRadius = sizeStyle.borderRadius
        self.height = sizeStyle.height
        self.verticalPadding = sizeStyle.verticalPadding
        self.horizontalPadding = sizeStyle.horizontalPadding

        textStyle = AndesBadgeViewConfig.getTextStyle(font: sizeStyle.font, color: textColor, lineSpacing: sizeStyle.lineSpacing)
        self.text = text

        self.roundedCorners = AndesBadgeBorderFactory.provide(border).corners
    }

    private static func getTextStyle(font: UIFont, color: UIColor, lineSpacing: CGFloat) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: font, lineSpacing: lineSpacing)
    }
}
