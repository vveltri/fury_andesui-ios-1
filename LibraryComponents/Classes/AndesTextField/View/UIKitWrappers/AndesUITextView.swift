//
//  AndesUITextView.swift
//  Adjust
//
//  Created by Nicolas Rostan Talasimov on 4/17/20.
//

import UIKit
class AndesUITextView: UITextView, AndesTextInputCustomBorderView {
    var onNeedsBorderUpdate: ((UIView) -> Void)?

    override func layoutSubviews() {
        super.layoutSubviews()
        self.onNeedsBorderUpdate?(self)
    }
}

protocol AndesTextInputCustomBorderView {
    var onNeedsBorderUpdate: ((UIView) -> Void)? { get set }
}
