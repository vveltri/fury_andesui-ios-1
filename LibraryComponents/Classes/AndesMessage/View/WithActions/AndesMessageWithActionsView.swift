//
//  AndesMessageWithActionsView.swift
//  AndesUI
//
//  Created by Nicolas Rostan Talasimov on 1/28/20.
//

import UIKit

class AndesMessageWithActionsView: AndesMessageAbstractView {
    @IBOutlet weak var primaryAction: AndesButton!
    @IBOutlet weak var secondaryAction: AndesButton!

    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesMessageWithActionsView", owner: self, options: nil)
    }

    override func updateView() {
        super.updateView()
        primaryAction.size = .medium
        secondaryAction.size = .medium

        primaryAction.updateWithCustomConfig(config.primaryActionConfig!)

        if let sConfig = config.secondaryActionConfig {
            secondaryAction.isHidden = false
            secondaryAction.updateWithCustomConfig(sConfig)
        } else {
            secondaryAction.isHidden = true
        }
    }

    @IBAction func primaryButtonTapped(_ sender: Any) {
        self.delegate?.primaryBtnTouchUp()
    }

    @IBAction func secondaryButtonTapped(_ sender: Any) {
        self.delegate?.secondaryBtnTouchUp()
    }
}
