//
//  AndesRadioButtonDefaultView.swift
//  AndesUI
//
//  Created by Rodrigo Pintos Costa on 6/30/20.
//

import Foundation
class AndesRadioButtonDefaultView: UIView, AndesRadioButtonView {
    @IBOutlet weak var radioButtonRightBtn: UIButton!

    @IBOutlet weak var radioButtonLabel: UILabel!

    @IBOutlet weak var radioButtonLeftBtn: UIButton!

    @IBOutlet var radioButtonView: UIView!

    weak var delegate: AndesRadioButtonViewDelegate?

    var config: AndesRadioButtonConfig

    init(withConfig config: AndesRadioButtonConfig) {
         self.config = config
         super.init(frame: .zero)
         setup()
     }

    override init(frame: CGRect) {
        self.config = AndesRadioButtonConfig()
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        self.config = AndesRadioButtonConfig()
        super.init(coder: coder)
        setup()

    }

    init() {
        self.config = AndesRadioButtonConfig()
        super.init(frame: .zero)
        setup()
    }

      func update(withConfig config: AndesRadioButtonConfig) {
          self.config = config
          updateView()
      }

      func loadNib() {
             let bundle = AndesBundle.bundle()
             bundle.loadNibNamed("AndesRadioButtonDefaultView", owner: self, options: nil)
      }

    func setup() {
        loadNib()
        self.addSubview(radioButtonView)
        radioButtonView.pinToSuperview()
        radioButtonView.translatesAutoresizingMaskIntoConstraints = false
        updateView()
    }

    func updateView() {
        clearView()
        /*self.label.text = config.title
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
        }*/

    }

    func clearView() {
        self.radioButtonLeftBtn.layer.borderColor = UIColor.clear.cgColor
        self.radioButtonRightBtn.layer.borderColor = UIColor.clear.cgColor
        self.radioButtonLeftBtn.layer.borderWidth = 0
        self.radioButtonRightBtn.layer.borderWidth = 0
        self.radioButtonLeftBtn.layer.backgroundColor = UIColor.clear.cgColor
        self.radioButtonRightBtn.layer.backgroundColor = UIColor.clear.cgColor
    }

}
