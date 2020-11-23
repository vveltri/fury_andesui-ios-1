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

        let rightComponent = AndesTextFieldComponentIcon(andesIconName: config.icon ?? "", tintColor: UIColor.Andes.blueML500)

        self.textField.updateWithCustomConfig(AndesTextFieldViewConfig(labelText: config.title,
                                                                       helperText: nil,
                                                                       counter: config.counter,
                                                                       placeholderText: config.placeholderText,
                                                                       stateStyle: stateStyle,
                                                                       leftViewComponent: nil,
                                                                       rightViewComponent: rightComponent,
                                                                       inputTraits: textField.inputTraits,
                                                                       paddings: paddings))
    }

    override func setText(text: String) {
        self.textField.text = text
    }
}

extension AndesDropdownDefaultView: AndesTextFieldDelegate {
    func andesTextFieldShouldBeginEditing(_ textField: AndesTextField) -> Bool {
        delegate?.didSelectAndesTextField()
        return false
    }
}
