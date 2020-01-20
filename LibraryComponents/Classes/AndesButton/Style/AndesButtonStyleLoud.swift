//
//  AndesButtonLoud.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 17/12/2019.
//

import Foundation

/**
The AndesButtonSizeProtocol provides the differents attributes that define the style of the button, these can be constants or calculated
*/
internal struct AndesButtonStyleLoud: AndesButtonStyleProtocol {

    public var idleColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor

    public var pressedColor: UIColor = AndesStyleSheetManager.styleSheet.accentTertiaryColor

    public var focusColor: UIColor = AndesStyleSheetManager.styleSheet.accentPrimaryColor

    public var disableColor: UIColor = UIColor.AndesColor.Gray.gray100

    public var fontColor: UIColor = AndesStyleSheetManager.styleSheet.textWhiteColor

}
