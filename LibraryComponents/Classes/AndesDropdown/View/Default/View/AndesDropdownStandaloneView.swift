//
//  LabelViewDefault.swift
//  AndesUI
//
//  Created by Jonathan Alonso Pinto on 11/12/20.
//

import Foundation

class AndesDropdownStandaloneView: AndesDropdownAbstractView {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!

    override var text: String {
        get {
            return titleLbl.text ?? ""
        }
        set {
            titleLbl.text = newValue
        }
    }

    override func loadNib() {
        let bundle = AndesDropdownBundle.bundle()
        bundle.loadNibNamed("AndesDropdownStandaloneView", owner: self, options: nil)
    }

    override func updateView() {

        guard let config = self.config, let font = config.font else { return }

        AndesIconsProvider.loadIcon(name: config.icon ?? "", placeItInto: iconImg)
        iconImg.tintColor = config.iconColor
        titleLbl.setAndesStyle(style: font)
    }

}
