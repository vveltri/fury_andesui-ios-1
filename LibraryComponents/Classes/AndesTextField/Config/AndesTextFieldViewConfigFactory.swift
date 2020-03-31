//
//  AndesTextFieldViewConfigFactory.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation
internal class AndesTextFieldViewConfigFactory {
    static func provideInternalConfig(from textField: AndesTextField) -> AndesTextFieldViewConfig {

        let stateStyle = AndesTextFieldStateFactory.getState(textField.state, isEditing: textField.isEditing)

        let config = AndesTextFieldViewConfig(labelText: textField.labelText,
                                              helperText: textField.helperText,
                                              counter: textField.counter,
                                              placeholderText: textField.placeholderText,
                                              stateStyle: stateStyle,
                                              leftViewComponent: textField.leftComponent,
                                              rightViewComponent: textField.rightComponent,
                                              inputTraits: textField.inputTraits)

        return config
    }
}
