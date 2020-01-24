//
//  AndesMessageViewDefault.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/15/20.
//

import Foundation

class AndesMessageDefaultView: AndesMessageAbstractView {
    @IBOutlet weak var titleLabel: UILabel!

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesMessageDefaultView", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
        titleLabel.font = config.titleFont
        titleLabel.textColor = config.textColor
        titleLabel.text = config.titleText
    }
}
