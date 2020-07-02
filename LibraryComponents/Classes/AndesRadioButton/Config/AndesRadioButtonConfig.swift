//
//  AndesRadioButtonConfig.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation

/// used to define the ui of internal AndesRadioButton views
internal struct AndesRadioButtonConfig {
    var title: String?
    var borderColor: UIColor?
    var textColor: UIColor!
    var align: AndesRadioButtonAlign = AndesRadioButtonAlign.left
    var backgroundColor: UIColor = UIColor.Andes.white
    var borderSize: CGFloat? = 2
    var type: AndesRadioButtonTypeProtocol! = AndesRadioButtonTypeIdle()
    var status: AndesRadioButtonStatusProtocol! = AndesRadioButtonStatusUnselected()

    init () {

    }

    init(for radiobutton: AndesRadioButton) {
        self.title = radiobutton.title
        self.align = radiobutton.align
        self.status = AndesRadioButtonStatusFactory.provide(radiobutton.status)
        self.type = AndesRadioButtonTypeFactory.provide(radiobutton.type, status: radiobutton.status)
        self.textColor = type.textColor
        self.borderColor = type.borderColor
        self.backgroundColor = type.backgroundColor
    }
}
