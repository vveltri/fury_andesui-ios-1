//
//  AndesBulletView.swift
//  AndesUI
//
//  Created by Martin Ezequiel Becerra on 2/25/21.
//

import UIKit

@objc class AndesBulletView: UIView {
    @IBOutlet weak var bulletView: UIView!
    @IBOutlet weak var bulletTextView: UITextView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }

    private func setup() {
        self.loadNib()
        self.bulletTextViewSetup()
    }

    private func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesBulletView", owner: self, options: nil)
    }

    private func bulletTextViewSetup() {
        self.bulletTextView.textContainerInset = .zero
        self.bulletTextView.textContainer.lineFragmentPadding = 0.0
    }

    func configure(bulletColor: UIColor, bulletText: NSAttributedString) {
        self.bulletView.backgroundColor = bulletColor
        self.bulletTextView.attributedText = bulletText
    }
}
