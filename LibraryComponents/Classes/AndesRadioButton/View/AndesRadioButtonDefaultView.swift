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
        self.radioButtonLabel.text = config.title

        if config.align == AndesRadioButtonAlign.left {
            self.radioButtonRightBtn.isHidden = true
            self.radioButtonLeftBtn.isHidden = false
            self.radioButtonLeftBtn.backgroundColor = config.backgroundColor
            self.radioButtonLeftBtn.layer.cornerRadius = radioButtonLeftBtn.frame.width/2
            self.radioButtonLeftBtn.titleEdgeInsets = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
        } else {
            self.radioButtonRightBtn.isHidden = false
            self.radioButtonLeftBtn.isHidden = true
            self.radioButtonRightBtn.backgroundColor = config.backgroundColor
            self.radioButtonRightBtn.layer.cornerRadius = radioButtonLeftBtn.frame.width/2
            self.radioButtonRightBtn.titleEdgeInsets = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
        }

        self.radioButtonLabel.setAndesStyle(style: AndesStyleSheetManager.styleSheet.bodyM(color: config.textColor))
        let borderColor: UIColor? = config.borderColor
        let borderSize: CGFloat? = config.borderSize
        if let currentBorderColor = borderColor, let currentBorderSize = borderSize {
            if self.radioButtonLeftBtn.isHidden == false {
                self.radioButtonLeftBtn.layer.borderColor = currentBorderColor.cgColor
                self.radioButtonLeftBtn.layer.borderWidth = currentBorderSize
            } else {
                self.radioButtonRightBtn.layer.borderColor = currentBorderColor.cgColor
                self.radioButtonRightBtn.layer.borderWidth = currentBorderSize
            }
        }

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
