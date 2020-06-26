//
//  AndesCheckboxDefaultView.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/15/20.
//

import Foundation

class AndesCheckboxDefaultView: UIView, AndesCheckboxView {
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var rightButton: UIButton!

    @IBOutlet weak var leftButton: UIButton!

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
    @IBAction func leftButtonTapped(_ sender: Any) {
        self.delegate?.checkboxTapped()
    }

    @IBAction func rightButtonTapped(_ sender: Any) {
        self.delegate?.checkboxTapped()
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
        clearView()
        self.label.text = config.title
        let checkboxIcon: String? = config.icon
        let iconColor: UIColor? = config.iconColor

        if config.align == AndesCheckboxAlign.left {
            self.rightButton.isHidden = true
            self.leftButton.isHidden = false
            self.leftButton.backgroundColor = config.backgroundColor
            self.backgroundLayer = self.leftButton.layer
        } else {
            self.rightButton.isHidden = false
            self.leftButton.isHidden = true
            self.rightButton.backgroundColor = config.backgroundColor
            self.backgroundLayer = self.rightButton.layer

        }

        if let currentIcon = checkboxIcon, !currentIcon.isEmpty {
            if let currentIconColor = iconColor {
                if self.leftButton.isHidden == false {
                    AndesIconsProvider.loadIcon(name: currentIcon) {
                        checkboxIcon in self.leftButton.setImage(checkboxIcon, for: .normal)
                    }
                    self.leftButton.tintColor = currentIconColor
                } else {
                    AndesIconsProvider.loadIcon(name: currentIcon) {
                        checkboxIcon in self.rightButton.setImage(checkboxIcon, for: .normal)
                    }
                    self.rightButton.tintColor = currentIconColor
                }
            }
        }
        self.label.setAndesStyle(style: AndesStyleSheetManager.styleSheet.bodyM(color: config.textColor))
        self.backgroundLayer.cornerRadius = config.cornerRadius
        let borderColor: UIColor? = config.borderColor
        let borderSize: CGFloat? = config.borderSize
        if let currentBorderColor = borderColor, let currentBorderSize = borderSize {
            if self.leftButton.isHidden == false {
                self.leftButton.layer.borderColor = currentBorderColor.cgColor
                self.leftButton.layer.borderWidth = currentBorderSize
            } else {
                self.rightButton.layer.borderColor = currentBorderColor.cgColor
                self.rightButton.layer.borderWidth = currentBorderSize
            }
        }

    }

    func clearView() {
        self.leftButton.layer.borderColor = UIColor.clear.cgColor
        self.rightButton.layer.borderColor = UIColor.clear.cgColor
        self.leftButton.layer.borderWidth = 0
        self.rightButton.layer.borderWidth = 0
        self.leftButton.setImage(nil, for: .normal)
        self.rightButton.setImage(nil, for: .normal)
    }

}
