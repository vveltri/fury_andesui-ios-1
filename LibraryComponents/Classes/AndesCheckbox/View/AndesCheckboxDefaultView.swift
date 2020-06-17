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
        config = AndesCheckboxViewConfig()
        self.backgroundLayer = CALayer()
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        config = AndesCheckboxViewConfig()
        self.backgroundLayer = CALayer()
        super.init(coder: coder)
        setup()

    }

    init() {
        self.backgroundLayer = CALayer()
        config = AndesCheckboxViewConfig()
        super.init(frame: .zero)
        setup()
    }

    func setup() {
        loadNib()
        self.backgroundLayer = self.iconView.layer
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

        if let currentIcon = checkboxIcon, !currentIcon.isEmpty {
            AndesIconsProvider.loadIcon(name: currentIcon, placeItInto: self.iconView)
            if let currentIconcCurrentColor = iconColor {
                self.iconView.tintColor = currentIconcCurrentColor
            }
        }
        self.label.setAndesStyle(style: AndesStyleSheetManager.styleSheet.bodyM(color: config.textColor))
        self.backgroundLayer.cornerRadius = config.cornerRadius
        let borderColor: UIColor? = config.borderColor
        let borderSize: CGFloat? = config.borderSize
        if let currentBorderColor = borderColor, let currentBorderSize = borderSize {
            self.iconView.layer.borderColor = currentBorderColor.cgColor
            self.iconView.layer.borderWidth = currentBorderSize
        }
    }

}
