//
//  AndesDropdownDefaultView.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

class AndesDropdownDefaultView: AndesDropdownAbstractView {

    override func loadNib() {
        let bundle = AndesDropdownBundle.bundle()
        bundle.loadNibNamed("AndesDropdownViewDefault", owner: self, options: nil)
    }

    override func updateView() {

        guard let config = self.config else { return }

        let stateStyle = AndesTextFieldStateFactory.getState(textField.state,
                                                             isEditing: textField.isEditing,
                                                             borderColor: config.borderColor)

        let paddings = AndesTextInputPaddingFactory.providePaddingForField(state: textField.state)

        let rightComponent = AndesTextFieldComponentIcon(andesIconName: config.icon ?? "",
                                                         tintColor: config.iconColor)

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
