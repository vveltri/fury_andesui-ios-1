//
//  AndesDropdownDefaultView.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 13/11/20.
//

import Foundation

class AndesDropdownDefaultView: AndesDropdownAbstractView {

    @IBOutlet var textField: AndesTextField!

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesDropdownDefaultView", owner: self, options: nil)
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

        let rightComponent = AndesTextFieldComponentIcon(andesIconName: AndesIcons.chevronDown20, tintColor: UIColor.Andes.blueML500)

        self.textField.updateWithCustomConfig(AndesTextFieldViewConfig(labelText: config.labelText,
                                                                       helperText: config.helperText,
                                                                       counter: config.counter,
                                                                       placeholderText: config.placeholderText,
                                                                       stateStyle: stateStyle,
                                                                       leftViewComponent: nil,
                                                                       rightViewComponent: rightComponent,
                                                                       inputTraits: textField.inputTraits,
                                                                       paddings: paddings))
    }
}

extension AndesDropdownDefaultView: AndesTextFieldDelegate {
    func andesTextFieldDidBeginEditing(_ textField: AndesTextField) {
        textField.resignFirstResponder()
        delegate?.didSelectAndesTextField()
    }
}
