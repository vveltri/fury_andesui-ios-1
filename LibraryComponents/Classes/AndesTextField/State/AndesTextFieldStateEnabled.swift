//
//  AndesTextFieldStateIdle.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation
struct AndesTextFieldStateIdle: AndesTextFieldStateProtocol {
    var borderColor = UIColor.Andes.gray250
    var borderWidth: CGFloat = 1
    var borderDashed = false

    var labelTextColor = AndesStyleSheetManager.styleSheet.textColorPrimary

    var helperColor = AndesStyleSheetManager.styleSheet.textColorSecondary
    var helperIconTintColor: UIColor? = AndesStyleSheetManager.styleSheet.textColorSecondary
    var helperIconName: String?

    var backgroundColor = AndesStyleSheetManager.styleSheet.bgColorWhite
    var inputTextColor = AndesStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = true

    var placeholderTextColor = AndesStyleSheetManager.styleSheet.textColorSecondary

    init(focuesd: Bool) {
        if focuesd {
            borderColor = AndesStyleSheetManager.styleSheet.accentColor
            borderWidth = 2
        }
    }

}

struct AndesTextFieldStateError: AndesTextFieldStateProtocol {
    var borderColor = AndesStyleSheetManager.styleSheet.feedbackColorNegative
    var borderWidth: CGFloat = 1
    var borderDashed: Bool = false

    var labelTextColor = AndesStyleSheetManager.styleSheet.textColorNegative

    var helperColor = AndesStyleSheetManager.styleSheet.textColorNegative
    var helperIconTintColor: UIColor? = AndesStyleSheetManager.styleSheet.textColorWhite
    var helperIconName: String? = "andes_ui_feedback_error_16"

    var backgroundColor = UIColor.Andes.red100
    var inputTextColor = AndesStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = true

    var placeholderTextColor = AndesStyleSheetManager.styleSheet.textColorSecondary

    init(focuesd: Bool) {
        if focuesd {
            backgroundColor = AndesStyleSheetManager.styleSheet.bgColorWhite
            borderWidth = 2
        }
    }

}

struct AndesTextFieldStateDisabled: AndesTextFieldStateProtocol {
    var borderColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var borderWidth: CGFloat = 1
    var borderDashed = true

    var labelTextColor = AndesStyleSheetManager.styleSheet.textColorDisabled

    var helperColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var helperIconTintColor: UIColor?
    var helperIconName: String?

    var backgroundColor = UIColor.Andes.gray100
    var inputTextColor: UIColor = AndesStyleSheetManager.styleSheet.textColorDisabled
    var editingEnabled = false

    var placeholderTextColor = AndesStyleSheetManager.styleSheet.textColorSecondary
}

struct AndesTextFieldStateReadonly: AndesTextFieldStateProtocol {
    var borderColor = UIColor.clear
    var borderWidth: CGFloat = 0
    var borderDashed: Bool = false

    var labelTextColor = AndesStyleSheetManager.styleSheet.textColorDisabled

    var helperColor = UIColor.clear
    var helperIconTintColor: UIColor?
    var helperIconName: String?

    var backgroundColor = UIColor.clear
    var inputTextColor = AndesStyleSheetManager.styleSheet.textColorPrimary
    var editingEnabled = false

    var placeholderTextColor = AndesStyleSheetManager.styleSheet.textColorDisabled
}
