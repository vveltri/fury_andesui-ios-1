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
    var labelStyle: AndesFontStyle = getLabelStyle(AndesStyleSheetManager.styleSheet.textColorPrimary)

    var helperText: String?
    var helperStyle: AndesFontStyle = getHelperTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)

    var counter: UInt16 = 0
    var counterStyle: AndesFontStyle = getCounterTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)

    var placeholderStyle: AndesFontStyle = getHelperTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)
    var placeholderText: String?

    var inputBgColor: UIColor = AndesStyleSheetManager.styleSheet.bgColorPrimary
    var inputTextStyle: AndesFontStyle = getHelperTextStyle(AndesStyleSheetManager.styleSheet.textColorPrimary)

    var textFieldBorderDashed = false
    var editingEnabled: Bool = true

    var textFieldBorderColor: UIColor = AndesStyleSheetManager.styleSheet.bgColorSecondary
    var textFieldBorderWidth: CGFloat = 1
    var textFieldBorderRadious: CGFloat = 6

    var helperIcon: String?
    var helperIconColor: UIColor?
    var helperIconBgColor: UIColor?

    var leftViewComponent: AndesTextFieldLeftComponent?
    var rightViewComponent: AndesTextFieldRightComponent?

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
        self.placeholderStyle = AndesTextFieldViewConfig.getInputTextStyle(stateStyle.placeholderTextColor)
        self.inputTextStyle = AndesTextFieldViewConfig.getInputTextStyle(stateStyle.inputTextColor)
        self.inputBgColor = stateStyle.backgroundColor
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

    internal static func getInputTextStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 16), sketchLineHeight: 14)
    }

    private static func getCounterTextStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 13), sketchLineHeight: 14)
    }
}
