//
//  AndesTextFieldViewConfig.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

/// used to define the ui of internal AndesTextField views
internal struct AndesTextFieldViewConfig {
    var labelText: String?
    var helperText: String?
    var counter: UInt16 = 0
    var placeholderText: String?
    var labelStyle: AndesFontStyle = getLabelStyle(AndesStyleSheetManager.styleSheet.textColorPrimary)
    var helperStyle: AndesFontStyle = getHelperTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)
    var counterStyle: AndesFontStyle = getCounterTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)
    var placeholderStyle: AndesFontStyle = getHelperTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)
    var inputTextStyle: AndesFontStyle = getHelperTextStyle(AndesStyleSheetManager.styleSheet.textColorPrimary)
    var textFieldBorderColor: UIColor = AndesStyleSheetManager.styleSheet.bgColorSecondary
    var textFieldBorderWidth: CGFloat = 1
    var textFieldBorderRadious: CGFloat = 6
    var helperIcon: String?
    var helperIconColor: UIColor?
    var helperIconBgColor: UIColor?
    var editingEnabled: Bool = true
    var leftViewComponent: AndesTextFieldLeftComponent?
    var rightViewComponent: AndesTextFieldRightComponent?
    var textFieldBorderDashed = false
    var textInputTraits: UITextInputTraits?

    init(labelText: String?,
         helperText: String?,
         counter: UInt16,
         placeholderText: String?,
         stateStyle: AndesTextFieldStateProtocol,
         leftViewComponent: AndesTextFieldLeftComponent?,
         rightViewComponent: AndesTextFieldRightComponent?,
         inputTraits: UITextInputTraits?) {

        self.labelText = labelText
        self.helperText = helperText
        self.counter = counter
        self.placeholderText = placeholderText

        self.labelStyle = AndesTextFieldViewConfig.getLabelStyle(stateStyle.labelTextColor)
        self.helperStyle = AndesTextFieldViewConfig.getHelperTextStyle(stateStyle.helperColor)
        self.counterStyle = AndesTextFieldViewConfig.getCounterTextStyle(stateStyle.helperColor)
        self.placeholderStyle = AndesTextFieldViewConfig.getHelperTextStyle(stateStyle.placeholderTextColor)
        self.inputTextStyle = AndesTextFieldViewConfig.getHelperTextStyle(stateStyle.inputTextColor)
        self.textFieldBorderColor = stateStyle.borderColor
        self.helperIcon = stateStyle.helperIconName
        self.helperIconColor = stateStyle.helperIconTintColor
        self.helperIconBgColor = stateStyle.helperColor
        self.editingEnabled = stateStyle.editingEnabled
        self.textFieldBorderWidth = stateStyle.borderWidth
        self.textFieldBorderDashed = stateStyle.borderDashed

        self.leftViewComponent = leftViewComponent
        self.rightViewComponent = rightViewComponent

        self.textInputTraits = inputTraits
    }

    init() {

    }

    private static func getLabelStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 14)
    }

    private static func getHelperTextStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 13), sketchLineHeight: 14)
    }

    private static func getCounterTextStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 13), sketchLineHeight: 14)
    }
}
