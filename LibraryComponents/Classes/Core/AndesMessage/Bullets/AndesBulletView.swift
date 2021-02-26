//
//  AndesBulletView.swift
//  AndesUI
//
//  Created by Martin Ezequiel Becerra on 2/25/21.
//

import UIKit

protocol AndesBulletViewDelegate: class {
    func andesbulletView(urlInteractionAt linkIndex: Int, forBullet bulletIndex: Int)
}

final class AndesBulletView: UIView, UITextViewDelegate {

    @IBOutlet weak var bulletView: UIView!
    @IBOutlet weak var bulletTextView: UITextView!

    var bulletIndex: Int = 0
    weak var delegate: AndesBulletViewDelegate?

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
        self.bulletTextView.delegate = self
    }

    func configure(bulletColor: UIColor, bulletText: NSAttributedString, delegate: AndesBulletViewDelegate?, at bulletIndex: Int) {
        self.bulletView.backgroundColor = bulletColor
        self.bulletTextView.attributedText = bulletText
        self.bulletIndex = bulletIndex
        self.delegate = delegate
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let index = Int(String(describing: URL)) ?? 0
        self.delegate?.andesbulletView(urlInteractionAt: index, forBullet: self.bulletIndex)
        return false
    }
}
