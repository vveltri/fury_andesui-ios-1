//
//  AndesButtonLargeWithIcon.swift
//  AndesUI
//
//  Created by LEANDRO FURYK on 26/12/2019.
//

import Foundation

/**
 AndesButtonViewDefault is the representation for an AndesButton that has an icon, its unique responsability is carry an icon and draw it
 */
internal class AndesButtonViewWithIcon: AndesButtonAbstractView {

    private var iconImage: UIImage

    @IBOutlet var icon: UIImageView!

    public init(style: AndesButtonStyleProtocol, size: AndesButtonSizeProtocol, icon: AndesButtonIcon) {
        self.iconImage = icon.icon
        super.init(size: size, style: style)
    }

    required init?(coder: NSCoder) {
        self.iconImage = UIImage()
        super.init(coder: coder)
    }

    override internal func setupStyle() {
        super.setupStyle()

        icon.image = iconImage
        icon.highlightedImage = iconImage
    }
}
