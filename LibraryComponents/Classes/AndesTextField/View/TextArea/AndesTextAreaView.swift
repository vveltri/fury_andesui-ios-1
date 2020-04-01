//
//  AndesTextAreaView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/26/20.
//

import Foundation

class AndesTextAreaView: AndesTextFieldAbstractView {
    @IBOutlet weak var textView: UITextView!

    override var text: String {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
        }
    }

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextAreaView", owner: self, options: nil)
        textView.delegate = self
    }

    override func updateView() {
        super.updateView()
        if let traits = config.textInputTraits {
            self.textView.setInputTraits(traits)
        }
    }
}

extension AndesTextAreaView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.delegate?.didBeginEditing()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        self.delegate?.didEndEditing(text: self.text)
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
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

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        guard delegate?.shouldBeginEditing() != false else {
            return false
        }

        return true
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        guard delegate?.shouldBeginEditing() != false else {
            return false
        }

        return true
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.didChangeSelection(selectedRange: textView.selectedTextRange)
    }

    func textViewDidChange(_ textView: UITextView) {
        delegate?.didChange()
    }
}

private extension UITextView {
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
