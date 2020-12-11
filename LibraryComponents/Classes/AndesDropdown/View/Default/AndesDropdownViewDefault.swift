//
//  AndesDropdownDefaultView.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

class AndesDropdownDefaultView: AndesDropdownAbstractView {

    override var text: String {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }

    override func loadNib() {
        let bundle = AndesDropdownBundle.bundle()
        bundle.loadNibNamed("AndesDropdownViewDefault", owner: self, options: nil)
    }

    override func setup() {
        super.setup()
        self.textField.delegate = self
        updateView()
    }

    override func updateView() {

        let stateStyle = AndesTextFieldStateFactory.getState(textField.state,
                                                             isEditing: textField.isEditing,
                                                             borderColor: self.config.borderColor)

        let paddings = AndesTextInputPaddingFactory.providePaddingForField(state: textField.state)

        let rightComponent = AndesTextFieldComponentIcon(andesIconName: config.icon ?? "", tintColor: self.config.iconColor)

        self.textField.updateWithCustomConfig(AndesTextFieldViewConfig(labelText: config.title,
                                                                       helperText: nil,
                                                                       counter: 0,
                                                                       placeholderText: config.placeholderText,
                                                                       stateStyle: stateStyle,
                                                                       leftViewComponent: nil,
                                                                       rightViewComponent: rightComponent,
                                                                       inputTraits: textField.inputTraits,
                                                                       paddings: paddings,
                                                                       size: config.size))
    }
}
