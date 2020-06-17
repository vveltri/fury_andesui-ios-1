//
//  AndesCheckboxDefaultView.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

class AndesCheckboxDefaultView: UIView, AndesCheckboxView {
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var iconView: UIImageView!

    @IBOutlet weak var iconViewRight: UIImageView!

    @IBOutlet var checkboxView: UIView!
    internal var backgroundLayer: CALayer

    weak var delegate: AndesCheckboxViewDelegate?

    var config: AndesCheckboxViewConfig
    init(withConfig config: AndesCheckboxViewConfig) {
        self.config = config
        self.backgroundLayer = CALayer()
        super.init(frame: .zero)
        setup()
    }

    func update(withConfig config: AndesCheckboxViewConfig) {
        self.config = config
        updateView()
    }

    func loadNib() {
           let bundle = AndesBundle.bundle()
           bundle.loadNibNamed("AndesCheckboxDefaultView", owner: self, options: nil)
    }

    override init(frame: CGRect) {
        self.config = AndesCheckboxViewConfig()
        self.backgroundLayer = CALayer()
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesCheckboxViewConfig()
        self.backgroundLayer = CALayer()
        super.init(coder: coder)
        setup()

    }

    init() {
        self.backgroundLayer = CALayer()
        self.config = AndesCheckboxViewConfig()
        super.init(frame: .zero)
        setup()
    }

    func setup() {
        loadNib()
        self.addSubview(checkboxView)
        checkboxView.pinToSuperview()
        checkboxView.translatesAutoresizingMaskIntoConstraints = false
        updateView()
    }

    func updateView() {
        self.label.text = config.title
        let checkboxIcon: String? = config.icon
        let iconColor: UIColor? = config.iconColor
        self.iconView.backgroundColor = config.backgroundColor

        if config.align == AndesCheckboxAlign.left {
            self.iconViewRight.isHidden = true
            self.iconView.isHidden = false
            self.backgroundLayer = self.iconView.layer
        } else {
            self.iconViewRight.isHidden = false
            self.iconView.isHidden = true
            self.backgroundLayer = self.iconViewRight.layer
        }

        if let currentIcon = checkboxIcon, !currentIcon.isEmpty {
            if let currentIconColor = iconColor {
                if self.iconView.isHidden == false {
                    AndesIconsProvider.loadIcon(name: currentIcon, placeItInto: self.iconView)
                    self.iconView.tintColor = currentIconColor
                } else {
                    AndesIconsProvider.loadIcon(name: currentIcon, placeItInto: self.iconViewRight)
                    self.iconViewRight.tintColor = currentIconColor
                }
            }
        }
        self.label.setAndesStyle(style: AndesStyleSheetManager.styleSheet.bodyM(color: config.textColor))
        self.backgroundLayer.cornerRadius = config.cornerRadius
        let borderColor: UIColor? = config.borderColor
        let borderSize: CGFloat? = config.borderSize
        if let currentBorderColor = borderColor, let currentBorderSize = borderSize {
            if self.iconView.isHidden == false {
                self.iconView.layer.borderColor = currentBorderColor.cgColor
                self.iconView.layer.borderWidth = currentBorderSize
            } else {
                self.iconViewRight.layer.borderColor = currentBorderColor.cgColor
                self.iconViewRight.layer.borderWidth = currentBorderSize
            }
        }

    }

}
