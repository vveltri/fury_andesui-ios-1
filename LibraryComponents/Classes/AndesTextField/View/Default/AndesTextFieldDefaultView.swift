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
            guard let text = textField.text else {
                return ""
            }
            return text
        }
        set(value) {
            textField.text = value
        }
    }

    var currentVisibilities: [AndesTextFieldComponentVisibility] {
        return self.text.isEmpty ? [.always] : [.always, .whenNotEmpty]
    }

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextFieldDefaultView", owner: self, options: nil)
    }

    override func clear() {
        super.clear()
        updateSideComponents()
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
        // side components
        updateSideComponents()

        //Counter
        let maxLength = Int(config.counter)
        guard maxLength > 0 else { return } // dont check length if counter = 0

        if self.text.count > maxLength { // don't trim string if maxLength >= currentText length
            textField.text = String(self.text.prefix(maxLength))
            DispatchQueue.main.async { // for some reason if you paste text that has to be trimmed the cursor doesn't move to the end of the text, this is a workaround for that case
                textField.selectedTextRange = textField.textRange(from: textField.endOfDocument, to: textField.endOfDocument)
            }
        }
        self.counterLabel.text = "\(self.text.count) / \(config.counter)"

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
        updateSideComponents()
    }

    func updateSideComponents() {
        if let leftComponentConfig = config.leftViewComponent, currentVisibilities.contains(leftComponentConfig.visibility) {
            textField.leftView = AndesTextFieldComponentFactory.generateLeftComponentView(for: leftComponentConfig, in: self)
        } else {
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        }
        if let rightComponentConfig = config.rightViewComponent, currentVisibilities.contains(rightComponentConfig.visibility) {
            textField.rightView = AndesTextFieldComponentFactory.generateRightComponentView(for: rightComponentConfig, in: self)
        } else {
            textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        }
    }

}

extension AndesTextFieldAbstractView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField(shouldChangeCharactersIn: range, replacementString: text) != false
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.didBeginEditing()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.didEndEditing(text: self.text)
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return delegate?.shouldEndEditing() != false
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return delegate?.shouldBeginEditing() != false
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
