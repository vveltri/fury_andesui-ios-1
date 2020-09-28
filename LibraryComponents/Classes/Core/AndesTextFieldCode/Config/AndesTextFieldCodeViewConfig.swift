//
//  AndesTextFieldCodeViewConfig.swift
//  AndesUI
//
//  Created by Esteban Adrian Boffa on 16/09/2020.
//

import Foundation

/// Used to define the UI of internal AndesTextFieldCode views.
struct AndesTextFieldCodeViewConfig {

    var labelText: String?
    var helperText: String?
    var style: AndesTextFieldCodeStyle = .THREESOME
    var state: AndesTextFieldCodeState = .IDLE
    var labelStyle: AndesFontStyle = getLabelStyle(AndesStyleSheetManager.styleSheet.textColorPrimary)
    var helperStyle: AndesFontStyle = getHelperTextStyle(AndesStyleSheetManager.styleSheet.textColorSecondary)
    var helperIcon: String?
    var helperIconTintColor: UIColor?
    var helperIconBgColor: UIColor?

    init(labelText: String?, helperText: String?, style: AndesTextFieldCodeStyle, state: AndesTextFieldCodeState) {
        self.labelText = labelText
        self.helperText = helperText
        self.style = style
        self.state = state
        self.labelStyle = AndesTextFieldCodeViewConfig.getLabelStyle(state)
        self.helperStyle = AndesTextFieldCodeViewConfig.getHelperTextStyle(state)
        self.helperIcon = AndesTextFieldCodeViewConfig.getHelperIcon(state)
        self.helperIconTintColor = AndesTextFieldCodeViewConfig.getHelperIconTintColor(state)
        self.helperIconBgColor = AndesTextFieldCodeViewConfig.getHelperIconBgColor(state)
    }

    init() {
    }
}

// MARK: Privates
private extension AndesTextFieldCodeViewConfig {
    static func getLabelStyle(_ state: AndesTextFieldCodeState) -> AndesFontStyle {
        return AndesTextFieldCodeViewConfig.getLabelStyle(AndesTextFieldCodeStateFactory.getState(state).labelTextColor)
    }

    static func getHelperTextStyle(_ state: AndesTextFieldCodeState) -> AndesFontStyle {
        AndesTextFieldCodeViewConfig.getHelperTextStyle(AndesTextFieldCodeStateFactory.getState(state).helperTextColor, semiBold: AndesTextFieldCodeStateFactory.getState(state).helperSemibold)
    }

    static func getLabelStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 14)
    }

    static func getHelperTextStyle(_ color: UIColor, semiBold: Bool = false) -> AndesFontStyle {
        let font = semiBold ? AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 13) : AndesStyleSheetManager.styleSheet.regularSystemFont(size: 13)
        return AndesFontStyle(textColor: color, font: font, sketchLineHeight: 14)
    }

    static func getHelperIcon(_ state: AndesTextFieldCodeState) -> String? {
        return AndesTextFieldCodeStateFactory.getState(state).helperIconName
    }

    static func getHelperIconTintColor(_ state: AndesTextFieldCodeState) -> UIColor? {
        return AndesTextFieldCodeStateFactory.getState(state).helperIconTintColor
    }

    static func getHelperIconBgColor(_ state: AndesTextFieldCodeState) -> UIColor {
        return AndesTextFieldCodeStateFactory.getState(state).helperIconBgColor
    }
}
