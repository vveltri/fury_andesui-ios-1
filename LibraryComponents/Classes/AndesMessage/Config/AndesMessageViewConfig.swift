//
//  AndesMessageViewConfig.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/17/20.
//

import Foundation

/// used to define the ui of internal AndesMessage views
internal struct AndesMessageViewConfig {
    var backgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor
    var pipeColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor
    var textColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor

    var titleText: String?
    var titleFont: UIFont = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16)

    var bodyFont: UIFont = AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14)
    var bodyText: String?

    var icon: UIImage?
    var iconColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor
    var iconBackgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentSecondaryColor

    var isDismissable: Bool = false
    var dismissIcon: UIImage? = UIImage(named: "andes_ui_close_20", in: AndesBundle.bundle(), compatibleWith: nil)!
    var dismissIconColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor

    var primaryActionConfig: AndesButtonViewConfig?
    var secondaryActionConfig: AndesButtonViewConfig?

    init(backgroundColor: UIColor, pipeColor: UIColor, textColor: UIColor, titleText: String?, bodyText: String, icon: UIImage?, iconBackgroundColor: UIColor, isDismissable: Bool, dismissIconColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.pipeColor = pipeColor
        self.textColor = textColor

        self.titleText = titleText
        self.bodyText = bodyText
        self.icon = icon
        self.isDismissable = isDismissable

        self.iconBackgroundColor = iconBackgroundColor
        self.dismissIconColor = dismissIconColor
    }

    init() {

    }
}
