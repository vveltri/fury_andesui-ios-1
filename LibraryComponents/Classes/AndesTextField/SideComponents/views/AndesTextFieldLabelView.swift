//
//  AndesTextFieldLabelView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 4/1/20.
//

import Foundation
class AndesTextFieldLabelView: UIView {
    private var text: String?
    private var style: AndesFontStyle?
    private let smallMargin: CGFloat = 8
    private let normalMargin: CGFloat = 12

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    convenience init(text: String, style: AndesFontStyle, rightSide: Bool = false) {
        self.init()

        self.text = text
        self.style = style
        setUp(invertedMargins: rightSide)
    }

    func setUp(invertedMargins: Bool = false) {
        guard let text = self.text, let style = self.style else {
            return
        }
        let label = UILabel()
        label.text = text
        label.setAndesStyle(style: style)
        label.sizeToFit()
        self.addSubview(label)
        label.pinToSuperview(top: 0, left: invertedMargins ? smallMargin : normalMargin, bottom: 0, right: invertedMargins ? normalMargin : smallMargin)
    }
}
