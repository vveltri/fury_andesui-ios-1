//
//  AndesDropdownDefaultView.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

class AndesDropdownDefaultView: AndesDropdownAbstractView {

    @IBOutlet var textField: AndesTextField!

    override var text: String {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesDropdownViewDefault", owner: self, options: nil)
    }

    override func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        self.textField.delegate = self
        pinXibViewToSelf()
        updateView()
        self.backgroundColor = .clear
        self.clipsToBounds = true
    }

    override func updateView() {

        var stateStyle = AndesTextFieldStateFactory.getState(textField.state, isEditing: textField.isEditing)
        stateStyle.borderColor = self.config.borderColor

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

extension AndesDropdownDefaultView: AndesTextFieldDelegate {
    func andesTextFieldShouldBeginEditing(_ textField: AndesTextField) -> Bool {
        delegate?.didSelectAndesTextField()
        return false
    }
}
