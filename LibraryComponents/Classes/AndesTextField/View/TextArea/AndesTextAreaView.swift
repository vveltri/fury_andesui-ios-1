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
        let currentText = self.text
        guard config.counter > 0 else { // no limit
            return true
        }
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
}
