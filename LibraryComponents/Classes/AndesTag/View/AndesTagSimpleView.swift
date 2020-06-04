//
//  AndesTagSimpleView.swift
//  AndesUI
//
//  Created by Samuel Sainz on 5/28/20.
//

import Foundation

class AndesTagSimpleView: AndesTagAbstractView {

    @IBOutlet weak var leftContentWidthConstraint: NSLayoutConstraint!

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesTagSimpleView", owner: self, options: nil)
    }

    override func updateView() {
        self.backgroundColor = config.backgroundColor
        self.layer.borderColor = config.borderColor.cgColor
        self.layer.borderWidth = 1.2
        self.rightButton.tintColor = config.buttonColor
        self.heightConstraint.constant = config.height ?? 24
        // TODO: set padding
        self.layer.cornerRadius = config.cornerRadius ?? 12
        textLabel.text = config.text
        textLabel.font = config.textFont
        textLabel.textColor = config.textColor

        AndesIconsProvider.loadIcon(name: AndesIcons.close16) { image in
            self.rightButton.setImage(image, for: .normal)
        }

        if config.leftContent != nil {
            // set left content
        } else {
            self.leftContentWidthConstraint.constant = 0
            self.leadingConstraint.constant = config.horizontalPadding ?? 0
        }

        if config.isDismissable {
            self.rightButtonWidthConstraint.constant = 32
            self.trailingConstraint.constant = 0
        } else {
            self.rightButtonWidthConstraint.constant = 0
            self.trailingConstraint.constant = config.horizontalPadding ?? 0
        }
    }
}
