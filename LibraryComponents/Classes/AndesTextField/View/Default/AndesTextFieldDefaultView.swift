//
//  AndesTextFieldDefaultView.swift
//  AndesUI
//
//  Created by Martin Damico on 10/03/2020.
//

import Foundation

class AndesTextFieldDefaultView: AndesTextFieldAbstractView {
    @IBOutlet weak var textField: UITextField!

    override var text: String {
        get {
            return textField.text!
        }
        set(value) {
            textField.text = value
        }
    }

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextFieldDefaultView", owner: self, options: nil)
    }

    override func setup() {
        super.setup()
        self.textField.delegate = self
        self.textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.addTarget(self, action: #selector(self.textChanged), for: UIControl.Event.editingChanged)
    }

    @objc func textChanged(_ textField: UITextField) {
        delegate?.didChange()
    }

    override func updateView() {
        super.updateView()
        if let placeholder = config.placeholderText {
            let placeholderAttrs = [NSAttributedString.Key.font: config.placeholderStyle.font,
                                    NSAttributedString.Key.strokeColor: config.placeholderStyle.textColor]
            self.textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttrs)
        }

        self.textField.textColor = config.inputTextStyle.textColor
        self.textField.font = config.inputTextStyle.font
        self.textField.isEnabled = config.editingEnabled
        if let traits = config.textInputTraits {
            self.textField.setInputTraits(traits)
        }

        // set side component views
        if let leftComponentConfig = config.leftViewComponent {
            textField.leftView = AndesTextFieldComponentFactory.generateLeftComponentView(for: leftComponentConfig, in: self)
        } else {
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        }
        if let rightComponentConfig = config.rightViewComponent {
            textField.rightView = AndesTextFieldComponentFactory.generateRightComponentView(for: rightComponentConfig, in: self)
        } else {
            textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        }

    }
}

extension AndesTextFieldAbstractView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard delegate?.textField(shouldChangeCharactersIn: range, replacementString: text) != false else {
            return false
        }

        guard config.counter > 0 else { // no limit
            return true
        }

        let currentText = self.text
        guard let rangeOfTextToReplace = Range(range, in: currentText) else {
                return false
        }

        let substringToReplace = currentText[rangeOfTextToReplace]
        let count = currentText.count - substringToReplace.count + text.count

        if count <= config.counter {
            self.counterLabel.text = "\(count) / \(config.counter)"
            return true
        }

        return false
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.didBeginEditing()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.didEndEditing(text: self.text)
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard delegate?.shouldEndEditing() != false else {
            return false
        }

        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard delegate?.shouldBeginEditing() != false else {
            return false
        }

        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.didChangeSelection(selectedRange: textField.selectedTextRange)
    }

}

private extension UITextField {
    func setInputTraits(_ traits: UITextInputTraits) {
        if let autocapitalizationType = traits.autocapitalizationType {
            self.autocapitalizationType = autocapitalizationType
        }
        if let autocorrectionType = traits.autocorrectionType {
            self.autocorrectionType = autocorrectionType
        }
        if let spellCheckingType = traits.spellCheckingType {
            self.spellCheckingType = spellCheckingType
        }
        if let enablesReturnKeyAutomatically = traits.enablesReturnKeyAutomatically {
            self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        }
        if let isSecureTextEntry = traits.isSecureTextEntry {
            self.isSecureTextEntry = isSecureTextEntry
        }
        if let keyboardAppearance = traits.keyboardAppearance {
            self.keyboardAppearance = keyboardAppearance
        }
        if let keyboardType = traits.keyboardType {
            self.keyboardType = keyboardType
        }
        if let returnKeyType = traits.returnKeyType {
            self.returnKeyType = returnKeyType
        }
        if let textContentType = traits.textContentType {
            self.textContentType = textContentType
        }
        if #available(iOS 11, *) {
            if let smartQuotesType = traits.smartQuotesType {
                self.smartQuotesType = smartQuotesType
            }
            if let smartDashesType = traits.smartDashesType {
                self.smartDashesType = smartDashesType
            }
            if let smartInsertDeleteType = traits.smartInsertDeleteType {
               self.smartInsertDeleteType = smartInsertDeleteType
           }
        }
        if #available(iOS 12, *) {
            if let passwordRules = traits.passwordRules {
                self.passwordRules = passwordRules
            }
        }
    }
}
