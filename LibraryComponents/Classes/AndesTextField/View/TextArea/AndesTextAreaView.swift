//
//  AndesTextAreaView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 3/26/20.
//

import Foundation

class AndesTextAreaView: AndesTextFieldAbstractView {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var placeholderLabel: UILabel!

    override var text: String {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
            textViewDidChange(textView)
        }
    }

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTextAreaView", owner: self, options: nil)
        textView.delegate = self
        self.textView.textContainerInset = UIEdgeInsets(top: 13, left: 9, bottom: 13, right: 9)
    }

    override func updateView() {
        super.updateView()
        placeholderLabel.setAndesStyle(style: config.placeholderStyle)
        placeholderLabel.text = config.placeholderText
        placeholderLabel.isHidden = self.text.count > 0
        self.textView.textColor = config.inputTextStyle.textColor
        self.textView.font = config.inputTextStyle.font
        self.textView.isUserInteractionEnabled = config.editingEnabled

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
        return delegate?.textField(shouldChangeCharactersIn: range, replacementString: text) != false
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return delegate?.shouldBeginEditing() != false
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return delegate?.shouldEndEditing() != false
    }

    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.didChangeSelection(selectedRange: textView.selectedTextRange)
    }

    func textViewDidChange(_ textView: UITextView) {
        self.delegate?.didChange()
        self.placeholderLabel.isHidden = self.text.count > 0
        self.checkLengthAndUpdateCounterLabel()
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
