//
//  AndesMessageViewConfig.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/17/20.
//

import Foundation

/// used to define the ui of internal AndesMessage views
internal struct AndesMessageViewConfig {
    var iconBackgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentSecondaryColor
    var backgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor
    var pipeColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor
    var titleText: String?
    var textColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor
    var titleFont: UIFont = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16)
    var bodyFont: UIFont = AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 14)
    var bodyText: String?
    var icon: UIImage = getIcon()
    var iconColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor
    var isDismissable: Bool = false
    var dismissIcon: UIImage? = getDismissIcon()
    var dismissIconColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor
    var primaryActionText: String?
    var secondaryActionText: String?

    //TODO:- REMOVE THIS WHEN ICONS ADDED
    static func getDismissIcon() -> UIImage {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: "multiply")!
        } else {
            return UIImage(named: "logo_global")!
        }
    }

    static func getIcon() -> UIImage {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: "exclamationmark")!
        } else {
            return UIImage(named: "logo_global")!
        }
    }
}
